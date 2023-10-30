import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ElementCard(item: item);

          //return ListTile(
          //  title: Text('SampleItem ${item.id}'),
          //  leading: const CircleAvatar(
          // Display the Flutter Logo image asset.
          //    foregroundImage: AssetImage('assets/images/flutter_logo.png'),
          //  ),
          //  onTap: () {
          // Navigate to the details page. If the user leaves and returns to
          // the app after it has been killed while running in the
          // background, the navigation stack is restored.
          //    Navigator.restorablePushNamed(
          //     context,
          //      SampleItemDetailsView.routeName,
          //    );
          //  }
          //);
        },
      ),
    );
  }
}

class ElementCard extends StatelessWidget {
  const ElementCard({
    super.key,
    required this.item,
  });

  final SampleItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      child: SizedBox(
        height: 150,
        width: double.maxFinite,
        child: Column(
          children: [
            AppBar(
              title: Text('SampleItem ${item.id}'),
            ),
            TextButton(
                child: Text("Products ${item.id}"),
                onPressed: () {
                  Navigator.restorablePushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                  );
                })
          ],
        ),
      ),
    );
  }
}
