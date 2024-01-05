import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/features/home/manger/save_urls_cubit/save_urls_cubit.dart';
import 'package:url_shortner/utils/snackbars/success_snackbar.dart';

class ListTileContainer extends StatelessWidget {
  const ListTileContainer({
    super.key,
    required this.urlPair,
  });

  final Map<String, dynamic> urlPair;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.6)),
      ),
      child: GestureDetector(
        onLongPress: () async {
          await Clipboard.setData(
              ClipboardData(text: "${urlPair['short_url']}"));
          SnackbarHelper.showCopiedItemSnackbarSuccess(
            context,
            "Short_Link_Copied_Successfully".tr(),
          );
        },
        child: ListTile(
          title: Text('${urlPair['short_url']}'),
          subtitle: Text('${urlPair['long_url']}'),
          trailing: IconButton(
            onPressed: () {
              BlocProvider.of<SaveUrlsCubit>(context).deleteUrl(urlPair['id']);
              SnackbarHelper.showDeleteItemSnackbarSuccess(context);
            },
            icon: const Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
