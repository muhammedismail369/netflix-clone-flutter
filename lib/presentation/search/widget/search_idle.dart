import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return Center(child: Text('Error while getting data'));
            } else if (state.idleList.isEmpty) {
              return Center(child: Text('List is empty'));
            }
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movie = state.idleList[index];
                  return TopSearchItemTile(
                      title: movie.title ?? 'No title provided',
                      imageUrl: '$imageAppendUrl${movie.posterPath}');
                },
                separatorBuilder: (ctx, index) => kHeight20,
                itemCount: state.idleList.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
