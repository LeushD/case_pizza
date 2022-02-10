import 'package:case_pizza/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyAppTheme());
}

final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

class MyAppTheme extends StatelessWidget {
  const MyAppTheme({Key? key}) : super(key: key);
  //final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          theme: globalTheme1(),
          darkTheme: globalTheme2(),
          themeMode: mode,
          home: const MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum SauceName {tomato, tar, hot}

class _MyAppState extends State<MyApp> {
  bool _thin = false;
  double _size = 40;
  int _cost = 290;
  SauceName? _sauceName = SauceName.hot;
  bool _cheese = false;
  Color _bgColor = const Color.fromRGBO(200, 200, 200, 0.75);


  void _slideThin(bool val) {
    setState(() {
      _thin = val;
      _calculate();
    });
  }

  void _onSizeChange(dynamic val) {
    setState(() {
      _size = val;
      _calculate();
    });
  }


  void _onCheeseClick(bool? val) {
    setState(() {
      _cheese = !_cheese;
      _calculate();
    });
  }

  void _onSauceClick(SauceName? val) {
    setState(() {
      _sauceName = val;
      _calculate();
    });
  }

  void _calculate() {
    _cost = 200 + (_size * 2).round() + (_thin ? 1 : 0) * 30 +
        (_cheese ? 1 : 0) * 40;
    switch (_sauceName) {
      case SauceName.tomato:
        _cost += 10;
        break;
      case SauceName.tar:
        _cost += 20;
        break;
      case SauceName.hot:
        _cost += 30;
        break;
      default:
        _cost += 10;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isDarkTheme = false;

    return MaterialApp(
      title: 'Калькулятор пиццы',
      theme: globalTheme1(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_light.jpg'),
                repeat: ImageRepeat.repeat,
              )
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  height: 180,
                  child: Image.asset('assets/images/pizza.png'),),
              ),
              SizedBox(height: 20,),
              Text('Калькулятор пиццы', style: Theme
                  .of(context)
                  .textTheme
                  .headline1,),
              const SizedBox(height: 9,),
              Text('Выберите параметры:', style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,),
              const SizedBox(height: 9,),
              SlidingSwitch(

                value: false,
                onChanged: _slideThin,
                onSwipe: () {},
                onDoubleTap: () {},
                onTap: () {},
                textOff: "Тонкое тесто",
                textOn: "Пышное тесто",
                width: 300,
                colorOn: Colors.red,
                colorOff: Colors.red,
                buttonColor: Color.fromRGBO(206, 188, 160, 1),
                inactiveColor: Color.fromRGBO(300, 300, 300, 0.65),
                background: _bgColor,

              ),
              const SizedBox(height: 20,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Размер:', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1)),
              const SizedBox(height: 9,),
              SizedBox(
                width: 300,
                child: SfSlider(
                  value: _size,
                  min: 20,
                  max: 40,
                  interval: 10,
                  showTicks: true,
                  showLabels: true,
//                    numberFormat: NumberFormat("## см"),
                  enableTooltip: false,
                  minorTicksPerInterval: 0,
                  stepSize: 10,
                  onChanged: _onSizeChange,

                ),
              ),
              const SizedBox(height: 9,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('На каком соусе:', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1)),
              RadioListTile<SauceName>(
                  title: Text('Томатный', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2),
                  value: SauceName.tomato,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              RadioListTile<SauceName>(
                  title: Text('Тар-тар', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2),
                  value: SauceName.tar,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              RadioListTile<SauceName>(
                  title: Text('Кимчи', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2),
                  value: SauceName.hot,
                  groupValue: _sauceName,
                  onChanged: _onSauceClick
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(200, 200, 200, 0.75),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/cheese.png', scale: 10,)),
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('Больше сыра', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1)
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch(
                            value: _cheese,
                            onChanged: _onCheeseClick
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 20,),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Стоимость:', style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1)),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('$_cost руб.', style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1)
                          )
                      ),
                    ]),
              ),
              const SizedBox(height: 20,),
              SizedBox(width: 154, height: 60,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Заказать', style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(206, 188, 160, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                    )),
              ),
              SwitchListTile(
                  title: Text('Тёмная тема'),
                  value: _isDarkTheme,
                  onChanged: (val) {
                    setState(() {
                      _isDarkTheme = !_isDarkTheme;
                      if (_isDarkTheme) {

                      }
                    });
                  }),
            ],
            ),
          ),
        ),
      ),
    );
    }
  }
