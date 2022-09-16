import 'package:flutter/material.dart';
import 'package:zaq_test/app_module/dashboard/models/forecast.dart';

class Popups {
  showPopup(context, Forecast forecast) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
                const Text('Weather Forecast'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Temperatures in ªC: '),
                    Text('${forecast.currentWeather!.temperature!}')
                  ],
                )
              ],
            ),
          );
        });
  }

  showPopupError(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
                const Text('Weather Forecast'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    maxLines: 2, 'Please double check latitude and longitude')
              ],
            ),
          );
        });
  }
}