import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_system/Ui/components/subscription_item.dart';
import 'package:gym_system/models/subscriptions_model.dart';

import '../../logic/services/api_manger.dart';
import '../components/page_limit_row.dart';
import '../components/screen_loading.dart';

class SubscriptionsPagination extends ConsumerWidget {
  SubscriptionsPagination({
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
                return FutureBuilder<SubscriptionsModel>(
                  future: ApiManger.getSubscriptions(
                    page: ref.read(pageProvider.notifier).state.toString(),
                    limit: ref.read(limitProvider.notifier).state.toString(),
                    query: query,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<SubscriptionsModel> snapshot) {
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
                          return (snapshot.data?.subscribtions?.isEmpty ?? true)
                              ? Center(
                                  child: Text('No Subscriptions Found'.tr()),
                                )
                              : Column(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: ListView.builder(
                                          itemCount: snapshot.data
                                                  ?.subscribtions?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return SubscriptionItem(
                                              provider: listViewRebuilding,
                                              subscribtion: snapshot
                                                  .data!.subscribtions![index],
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
