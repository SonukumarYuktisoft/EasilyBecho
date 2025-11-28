import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easilybecho/core/common/sliver_header_widget/CommonSliverHeader.dart';
import 'package:easilybecho/core/utility/utility_screen/loading_screen.dart';
import 'package:easilybecho/core/utility/utility_screen/network_controller.dart';
import 'package:easilybecho/core/utility/utility_screen/not_network_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final NetworkController networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Network Check
        if (!networkController.isOnline.value) {
          return NotNetworkScreen();
        }

        // MAIN UI START
        return CustomScrollView(
          slivers: [
            // ---------------- Sliver Appbar ----------------
            SliverAppBar(
              title: Text("Dashboard"),
              floating: true,
              pinned: true,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.orange.shade200,
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome Sonu!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // ---------------- Sticky Header ----------------
            SliverPersistentHeader(
              pinned: true,
              delegate: CommonSliverHeader(
                minHeight: 70,
                maxHeight: 70,
                builder: (shrink, overlap) {
                  return SizedBox.expand(
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return Chip(
                            label: Text(
                              "Item $index",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black54,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // ---------------- Section Title ----------------
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Top Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // ---------------- Sliver Grid ----------------
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Grid Item $index",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }, childCount: 6),
            ),

            // ---------------- Section Title ----------------
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Recent Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // ---------------- Sliver List ----------------
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text("List Item $index"),
                  subtitle: Text("Description of item $index"),
                );
              }, childCount: 20),
            ),
          ],
        );
      }),
    );
  }
}
