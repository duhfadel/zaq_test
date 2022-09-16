import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/add_city/cubit/add_city_cubit.dart';
import 'package:zaq_test/app_module/add_city/cubit/add_city_state.dart';
import 'package:zaq_test/app_module/add_city/widgets/form_line.dart';
import 'package:zaq_test/app_module/dashboard/models/city.dart';
import 'package:zaq_test/app_module/func_module/animation.dart';

class AddCityView extends StatelessWidget {
  AddCityView({super.key});

  Animations animations = Animations();

  TextEditingController cityNameController = TextEditingController();
  TextEditingController cityCodeController = TextEditingController();
  TextEditingController cityLanguageController = TextEditingController();
  TextEditingController cityLongitudeController = TextEditingController();
  TextEditingController cityLatitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddCityCubit addCityCubit = context.read<AddCityCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add City'),
        centerTitle: true,
      ),
      body: BlocBuilder<AddCityCubit, AddCityState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            const Text('Please fill the form'),
            FormLine(
              text: 'City Name',
              controller: cityNameController,
              onChange: (value) {
                addCityCubit.setCity(value);
              },
            ),
            FormLine(
              text: 'City Code',
              controller: cityCodeController,
              onChange: (value) {
                addCityCubit.setCode(value);
              },
            ),
            FormLine(
              text: 'City Language',
              controller: cityLanguageController,
              onChange: (value) {
                addCityCubit.setLang(value);
              },
            ),
            FormLine(
              text: 'Longitude',
              controller: cityLongitudeController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,8})'))
              ],
              keyboardtype: TextInputType.number,
              onChange: (value) {
                addCityCubit.setLatitude(value);
              },
            ),
            FormLine(
              text: 'Latitude',
              controller: cityLatitudeController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,8})'))
              ],
              keyboardtype: TextInputType.number,
              onChange: (value) {
                addCityCubit.setLongitude(value);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
                width: double.maxFinite,
                height: 60,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                    onPressed: state.isReady
                        ? () {
                            addCityCubit.saveList();
                            addCityCubit.updateList();
                            Navigator.of(context).pop(
                              animations.createSecondRoute(),
                            );
                          }
                        : null,
                    child: const Text('Save')))
          ]),
        );
      }),
    );
  }
}
