import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/constants.dart';

class PageAndLimitPagination extends ConsumerWidget {
  PageAndLimitPagination({
    this.pageProvider,
    this.limitProvider,
    this.listViewRebuildingProvider,
  });

  StateProvider? pageProvider, limitProvider, listViewRebuildingProvider;
  TextEditingController pageFieldController = TextEditingController(text: '1');
  TextEditingController limitFieldController =
      TextEditingController(text: '10');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(limitProvider!);
    ref.watch(pageProvider!);
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Text(
            'Limit',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (ref.read(limitProvider!.notifier).state != 10) {
                    ref.read(limitProvider!.notifier).state = 10;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ref.read(limitProvider!.notifier).state == 10
                        ? Colors.black
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: ref.read(limitProvider!.notifier).state == 10
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  if (ref.read(limitProvider!.notifier).state != 100) {
                    ref.read(limitProvider!.notifier).state = 100;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ref.read(limitProvider!.notifier).state == 100
                        ? Colors.black
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '100',
                    style: TextStyle(
                      color: ref.read(limitProvider!.notifier).state == 100
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  if (ref.read(limitProvider!.notifier).state != 200) {
                    ref.read(limitProvider!.notifier).state = 200;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ref.read(limitProvider!.notifier).state == 200
                        ? Colors.black
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '200',
                    style: TextStyle(
                      color: ref.read(limitProvider!.notifier).state == 200
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  if (ref.read(limitProvider!.notifier).state != 300) {
                    ref.read(limitProvider!.notifier).state = 300;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ref.read(limitProvider!.notifier).state == 300
                        ? Colors.black
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '300',
                    style: TextStyle(
                      color: ref.read(limitProvider!.notifier).state == 300
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  if (ref.read(limitProvider!.notifier).state != 500) {
                    ref.read(limitProvider!.notifier).state = 500;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ref.read(limitProvider!.notifier).state == 500
                        ? Colors.black
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '500',
                    style: TextStyle(
                      color: ref.read(limitProvider!.notifier).state == 500
                          ? Colors.white
                          : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (ref.read(pageProvider!.notifier).state > 1) {
                    ref.read(pageProvider!.notifier).state--;
                    ref.read(listViewRebuildingProvider!.notifier).state =
                        DateTime.now().toString();
                  }
                  pageFieldController.text =
                      ref.read(pageProvider!.notifier).state.toString();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                tooltip: "السابق",
              ),
              SizedBox(
                width: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: pageFieldController,
                  textAlign: TextAlign.center,
                  onEditingComplete: () {
                    try {
                      ref.read(pageProvider!.notifier).state =
                          int.parse(pageFieldController.text.toString());
                      ref.read(listViewRebuildingProvider!.notifier).state =
                          DateTime.now().toString();
                    } catch (_) {}
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(pageProvider!.notifier).state++;
                  ref.read(listViewRebuildingProvider!.notifier).state =
                      DateTime.now().toString();
                  pageFieldController.text =
                      ref.read(pageProvider!.notifier).state.toString();
                },
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
                tooltip: "التالي",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
