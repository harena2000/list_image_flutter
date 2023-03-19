import 'package:flutter/material.dart';
import 'package:flutter_practical_test/component/album_image.dart';
import 'package:flutter_practical_test/component/custom_text_field.dart';
import 'package:flutter_practical_test/component/custom_list_tile.dart';
import 'package:flutter_practical_test/component/loader_with_text.dart';
import 'package:flutter_practical_test/component/rounded_image.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';
import 'package:flutter_practical_test/provider/home_state.dart';
import 'package:flutter_practical_test/screen/album_details_screen.dart';
import 'package:flutter_practical_test/screen/details_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void navigateToDetails(ImageItemModel imageItemModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailsScreen(model: imageItemModel)));
  }

  void navigateToAlbum(List<ImageItemModel> imageListModel, int albumId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AlbumDetailsScreen(
                  imageListModel: imageListModel,
                  albumId: albumId,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(builder: (context, model, child) {
      return ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: Colors.black,
        progressIndicator: Scaffold(
          backgroundColor: Colors.black.withAlpha(0),
          body: Center(
            child: LoaderWithText(
              text: model.loadingText,
            ),
          ),
        ),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              bottom: TabBar(
                tabs: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: const Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: const Text("Album",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              title: const Text('Flutter Pratical Test'),
            ),
            backgroundColor: Colors.grey.shade800,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: model.filteredList.isEmpty
                    ? const Center(
                        child: Text("No data set"),
                      )
                    : TabBarView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                hintText: "Search",
                                icon: Icons.search_rounded,
                                onChange: (value) {
                                  model.filterItems(value);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: model.filteredList.isEmpty
                                      ? const Center(
                                          child: Text("No data set"),
                                        )
                                      : RefreshIndicator(
                                          onRefresh: model.refreshList,
                                          child: ListView.builder(
                                            itemCount:
                                                model.filteredList.length,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  navigateToDetails(model
                                                      .filteredList[index]);
                                                },
                                                child: SizedBox(
                                                  height: 80,
                                                  child: CustomListTile(
                                                    leadingImage: RoundedImage(
                                                      imageUrl: model
                                                          .filteredList[index]
                                                          .thumbnailUrl!,
                                                      widthHeight: 200,
                                                    ),
                                                    title: model
                                                        .filteredList[index]
                                                        .title!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ))
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                              spacing: 15,
                              runSpacing: 15,
                              children: List.generate(model.albumList.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    navigateToAlbum(
                                        model.albumList.values.elementAt(index),
                                        model.albumList.keys.elementAt(index));
                                  },
                                  child: AlbumImage(
                                    image1: model.albumList.values
                                        .elementAt(index)[0]
                                        .url!,
                                    image2: model.albumList.values
                                        .elementAt(index)[1]
                                        .url!,
                                    image3: model.albumList.values
                                        .elementAt(index)[2]
                                        .url!,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
