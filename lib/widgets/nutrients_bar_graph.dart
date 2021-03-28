import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';
import 'package:flutter_charts_example/models/nutrient.dart';

class NutrientBarGraph extends StatelessWidget {
  final List<Nutrient> nutrients;
  final bool onlyMacro;
  const NutrientBarGraph({Key key, this.nutrients, this.onlyMacro = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildGramChart(context)),
        const SizedBox(height: 16),
        Expanded(child: _buildMiliGramChart(context)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMiliGramChart(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Color(0xffffe4e1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffffe4e1), width: 2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Micronutrients (mg)",
            style: Theme.of(context).textTheme.button.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: chart.BarChart(
              [
                chart.Series<Nutrient, String>(
                  displayName: "Micronutrients",
                  id: "Nutrient mgs Bar Graph",
                  strokeWidthPxFn: (_, __) => 4,
                  colorFn: (_, __) => chart.Color.transparent,
                  fillColorFn: (_, __) =>
                      chart.ColorUtil.fromDartColor(Colors.pinkAccent),
                  measureFn: (Nutrient nutrient, _) => nutrient.value / 100,
                  domainFn: (Nutrient nutrient, _) =>
                      nutrient.type.replaceAll(" ", "\n"),
                  data: nutrients
                      .where((element) =>
                          element.type.toLowerCase() != 'total' &&
                          element.unit.toLowerCase() != 'kcal' &&
                          element.unit.toLowerCase() != 'g')
                      .toList(),
                ),
              ],
              domainAxis: chart.OrdinalAxisSpec(
                showAxisLine: true,
                renderSpec: chart.SmallTickRendererSpec(
                  labelStyle: chart.TextStyleSpec(
                      fontSize: 9,
                      fontWeight: '600',
                      color: chart.ColorUtil.fromDartColor(Colors.black)),
                  lineStyle: chart.LineStyleSpec(
                    color: chart.ColorUtil.fromDartColor(Colors.black),
                  ),
                  minimumPaddingBetweenLabelsPx: 12,
                ),
              ),
              primaryMeasureAxis: chart.NumericAxisSpec(
                renderSpec: chart.GridlineRendererSpec(
                  minimumPaddingBetweenLabelsPx: 12,
                  labelStyle: chart.TextStyleSpec(
                      fontSize: 10,
                      color: chart.ColorUtil.fromDartColor(Colors.black)),
                  lineStyle: chart.LineStyleSpec(
                    color: chart.ColorUtil.fromDartColor(Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGramChart(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xffffe4e1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffffe4e1), width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Macronutrients (g)",
            style: Theme.of(context).textTheme.button.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: chart.BarChart(
              [
                chart.Series<Nutrient, String>(
                  id: "Nutrient gs Bar Graph",
                  strokeWidthPxFn: (_, __) => 4,
                  radiusPxFn: (_, __) => 10,
                  measureFn: (Nutrient nutrient, _) {
                    return nutrient.value;
                  },
                  colorFn: (_, __) => chart.Color.transparent,
                  fillColorFn: (_, __) =>
                      chart.ColorUtil.fromDartColor(Color(0xFF178AE8)),
                  domainFn: (Nutrient nutrient, _) =>
                      nutrient.type.replaceAll(" ", "\n"),
                  data: nutrients.where((element) {
                    return element.type.toLowerCase() != 'total' &&
                        element.unit.toLowerCase() != 'kcal' &&
                        element.unit.toLowerCase() != 'mg';
                  }).toList(),
                ),
              ],
              domainAxis: chart.OrdinalAxisSpec(
                showAxisLine: true,
                renderSpec: chart.SmallTickRendererSpec(
                  labelRotation: 10,
                  labelAnchor: chart.TickLabelAnchor.after,
                  labelStyle: chart.TextStyleSpec(
                      fontSize: 9,
                      fontWeight: '600',
                      color: chart.ColorUtil.fromDartColor(Colors.black)),
                  lineStyle: chart.LineStyleSpec(
                    color: chart.ColorUtil.fromDartColor(Colors.black),
                  ),
                ),
              ),
              primaryMeasureAxis: chart.NumericAxisSpec(
                renderSpec: chart.GridlineRendererSpec(
                  labelStyle: chart.TextStyleSpec(
                    fontSize: 10,
                    color: chart.ColorUtil.fromDartColor(Colors.black),
                  ),
                  minimumPaddingBetweenLabelsPx: 12,
                  lineStyle: chart.LineStyleSpec(
                    color: chart.ColorUtil.fromDartColor(Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
