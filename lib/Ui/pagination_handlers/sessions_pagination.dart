import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/components/session_item.dart';
import 'package:gym_system/models/sessions_model.dart';

import '../../logic/services/api_manger.dart';
import '../components/page_limit_row.dart';
import '../components/screen_loading.dart';

class SessionsPagination extends ConsumerWidget {
  SessionsPagination({
    this.query,
  });

  String? query;
  final listViewRebuilding = StateProvider<String>((ref) => '');
  final refresh = StateProvider<String>((ref) => '');
  final pageProvider = StateProvider<int>((ref) => 1);
  final limitProvider = StateProvider<int>((ref) => 10);
  num? pages, items;
  final selectedSearchWithProvider = StateProvider<String>((ref) => '');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Consumer(
              builder: (context, ref, child) {
                ref.watch(listViewRebuilding);
                return FutureBuilder<SessionsModel>(
                  future: ApiManger.getSessions(
                    page: ref.read(pageProvider.notifier).state.toString(),
                    limit: ref.read(limitProvider.notifier).state.toString(),
                    query: query,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<SessionsModel> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        {
                          return ScreenLoading();
                        }
                      default:
                        if (snapshot.hasError) {
                          print(snapshot);

                          return Text('Error: ${snapshot.error.toString()}');
                        } else {
                          return (snapshot.data?.sessions?.isEmpty ?? true)
                              ? Center(
                                  child: Text('No Sessions Found'.tr()),
                                )
                              : Column(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: ListView.builder(
                                          itemCount:
                                              snapshot.data?.sessions?.length ??
                                                  0,
                                          itemBuilder: (context, index) {
                                            return SessionItem(
                                              session: snapshot
                                                  .data!.sessions![index],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                        }
                    }
                  },
                );
              },
            ),
          ),
        ),
        PageAndLimitPagination(
          pageProvider: pageProvider,
          limitProvider: limitProvider,
          listViewRebuildingProvider: listViewRebuilding,
        ),
      ],
    );
  }
}
