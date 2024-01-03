import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/features/home/manger/save_urls_cubit/save_urls_cubit.dart';

class DisplayUrlsViewBody extends StatefulWidget {
  const DisplayUrlsViewBody({Key? key}) : super(key: key);

  @override
  State<DisplayUrlsViewBody> createState() => _DisplayUrlsViewBodyState();
}

class _DisplayUrlsViewBodyState extends State<DisplayUrlsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All_Urls".tr()),
      ),
      body: BlocBuilder<SaveUrlsCubit, SaveUrlsState>(
        builder: (context, state) {
          if (state is SaveUrlsSuccess) {
            final urlsList = state.urlPairs;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: urlsList.length,
                itemBuilder: (context, index) {
                  final urlPair = urlsList[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.6)),
                    ),
                    child: ListTile(
                      title: Text('${urlPair['short_url']}'),
                      subtitle: Text('${urlPair['long_url']}'),
                    ),
                  );
                },
              ),
            );
          } else if (state is SaveUrlsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SaveUrlsFailure) {
            return Center(
                child: Text('Failed to fetch URLs: ${state.errMessage}'));
          } else {
            return Center(
              child: Text("No_URLs_available".tr()),
            );
          }
        },
      ),
    );
  }
}
