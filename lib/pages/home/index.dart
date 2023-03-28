import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: MoreChatColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Obx(() => Text(controller.title.value)),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: Text(
              //     'Drawer Header',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),

              ListTile(
                leading: Icon(Icons.settings_applications_outlined),
                title: Text('Set API KEY'),
                onTap: () async {
                  await controller.setAPIKEY();
                },
              ),

              ListTile(
                leading: Icon(Icons.add),
                title: Text('New Chat'),
                onTap: () async {
                  await controller.newChat();
                },
              ),

              Obx(() {
                var idx = 0;
                List<Widget> list = [];
                controller.chats.value.forEach((element) {
                  var cIdx = idx;
                  list.add(ListTile(
                    leading: Icon(Icons.chat),
                    trailing: IconButton(
                      onPressed: () {
                        controller.delChat(cIdx);
                      },
                      icon: Icon(Icons.highlight_remove_outlined),
                    ),
                    title: Text(element.title),
                    subtitle: Text(element.createTime),
                    onTap: () {
                      controller.selectChat(cIdx, element);
                      Navigator.pop(context);
                    },
                  ));
                  idx += 1;
                });

                return Column(
                  children: list,
                );
              }),
            ],
          ),
        ),
        body: Container(
          child: Obx(() {
            if (controller.chats.value.length == 0) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "新建一个聊天对话",
                      style: MoreChatFont.baseFont,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.newChat2();
                        },
                        child: Text("New Chat"))
                  ],
                ),
              );
            }

            if (controller.activeChat != null) {
              return Container(
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.grey,
                          child: ListView.separated(
                              itemBuilder: (context, idx) {
                                if (controller.activeChat!.chatItem
                                    .elementAt(idx)
                                    .isBot) {
                                  return Container(
                                    width: 100,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/images/logo.jpg"),
                                              radius: 25,
                                            ),
                                            Text(
                                              "DeepAI",
                                              style: MoreChatFont.baseFont
                                                  .copyWith(
                                                fontSize: 10,
                                              ),
                                            )
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SelectableText(
                                              controller.activeChat!.chatItem
                                                  .elementAt(idx)
                                                  .time,
                                              style: MoreChatFont.baseFont
                                                  .copyWith(fontSize: 10),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Container(
                                              child: SelectableText(
                                                controller.activeChat!.chatItem
                                                    .elementAt(idx)
                                                    .text,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF4F6F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }

                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/8596759.png"),
                                            radius: 25,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          Text(
                                            "You",
                                            style: MoreChatFont.baseFont
                                                .copyWith(fontSize: 10),
                                          )
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.activeChat!.chatItem
                                                .elementAt(idx)
                                                .time,
                                            style: MoreChatFont.baseFont
                                                .copyWith(fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Container(
                                            child: SelectableText(
                                              controller.activeChat!.chatItem
                                                  .elementAt(idx)
                                                  .text,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF4F6F8),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            padding: EdgeInsets.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, idx) => Container(),
                              itemCount:
                                  controller.activeChat!.chatItem.length),
                        )),
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 7,
                              child: TextField(
                                controller: controller.text,
                                minLines: 6,
                                decoration: InputDecoration(
                                  fillColor: Colors.blue,
                                  focusColor: Colors.blue,
                                  hoverColor: Colors.blue,
                                  // hintText: "点击填写故障文字说明…",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintStyle: TextStyle(color: Colors.white),
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  suffixStyle: TextStyle(color: Colors.white),
                                ),
                                maxLines: null,
                                style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  controller.moreChatSend();
                                },
                                child: Container(
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                  height: 80,
                                )),
                          )
                        ],
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      // ),
                    )),
                  ],
                ),
              );
            }

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "新建一个聊天对话",
                    style: MoreChatFont.baseFont,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.newChat2();
                      },
                      child: Text("New Chat"))
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
