import 'package:flutter/material.dart';
import 'package:flutter_charts_example/models/nutrient.dart';
import 'package:flutter_charts_example/widgets/custom_progress_bar.dart';
import 'package:flutter_charts_example/widgets/custom_tab_bar.dart';
import 'package:flutter_charts_example/widgets/nutrients_bar_graph.dart';
import 'package:flutter_charts_example/widgets/nutrients_pie_chart.dart';

class Graph extends StatefulWidget {
  const Graph({
    Key key,
  }) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  int index = 0;
  onIndexChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGraphsDisplay(context),
    );
  }

  Widget buildGraphsDisplay(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: kToolbarHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Graph",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Visualize",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          TextSpan(
                            text: " your scan.",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Color(0xFF178AE8)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTabBar(
                  items: const ["Pie chart", "Bar graph"],
                  defaultIndex: index,
                  onChanged: onIndexChanged,
                ),
              ),
              if (index == 0) ...[
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    children: [
                      NutrientPieChart(
                        nutrients: nutrients,
                        radius: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ],
                  ),
                )
              ] else ...[
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: NutrientBarGraph(
                      nutrients: nutrients,
                    ),
                  ),
                )
              ]
            ],
          ),
        )
      ],
    );
  }

  Widget getProgressBars() {
    // in mg
    num totalWeight = 0;
    for (int i = 0; i < nutrients.length; i++) {
      if (nutrients[i].type.toLowerCase() != 'total' &&
          nutrients[i].unit.toLowerCase() != 'kcal') {
        totalWeight += nutrients[i].unit.toLowerCase() == "g"
            ? nutrients[i].value * 1000
            : nutrients[i].value;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: nutrients.map((e) {
          if (e.value == 0) {
            return const SizedBox.shrink();
          }
          final num ratio =
              (e.unit.toLowerCase() == "g" ? e.value * 1000 : e.value) /
                  totalWeight;
          if (e.type.toLowerCase() == 'total') {
            return Column(
              children: [
                CustomProgressBar(
                  percent: 100,
                  color: e.color,
                  title: e.type,
                  value: "${e.value.toString()} ${e.unit}",
                ),
                const SizedBox(height: 4),
              ],
            );
          }
          if (e.unit.toLowerCase() == 'kcal') {
            return Column(
              children: [
                CustomProgressBar(
                  percent: 100,
                  title: e.type,
                  color: e.color,
                  value: "${e.value.toString()} ${e.unit}",
                ),
                const SizedBox(height: 4)
              ],
            );
          } else {
            return Column(
              children: [
                CustomProgressBar(
                  percent: (ratio * 100).toDouble(),
                  title: e.type,
                  color: e.color,
                  value: "${e.value.toString()} ${e.unit}",
                ),
                const SizedBox(height: 4)
              ],
            );
          }
        }).toList(),
      ),
    );
  }
}
