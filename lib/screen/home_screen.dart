import 'package:flutter/material.dart';
import 'package:flutter_practical_test/component/custom_text_field.dart';
import 'package:flutter_practical_test/component/custom_list_tile.dart';
import 'package:flutter_practical_test/component/loader_with_text.dart';
import 'package:flutter_practical_test/component/rounded_image.dart';
import 'package:flutter_practical_test/model/image_item_model.dart';
import 'package:flutter_practical_test/provider/home_state.dart';
import 'package:flutter_practical_test/screen/details_screen.dart';
import 'package:loadmore/loadmore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;

  void navigate(ImageItemModel imageItemModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailsScreen(model: imageItemModel)));
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
        child: Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                          : LoadMore(
                              isFinish: model.filteredList.length >= 20,
                              onLoadMore: model.loadMore,
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: model.filteredList.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        navigate(model.filteredList[index]);
                                      },
                                      child: CustomListTile(
                                        leadingImage: RoundedImage(
                                          imageUrl: model.filteredList[index]
                                              .thumbnailUrl!,
                                          widthHeight: 200,
                                        ),
                                        title: model.filteredList[index].title!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
