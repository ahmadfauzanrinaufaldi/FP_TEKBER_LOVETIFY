import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatelessWidget {
  final List<StatItem> stats = [
    StatItem(
        title: 'streams',
        value: '375',
        percentage: '-80%',
        color: Colors.green),
    StatItem(
        title: 'different tracks',
        value: '248',
        percentage: '-57%',
        color: Colors.green),
    StatItem(
        title: 'minutes streamed',
        value: '1,362',
        percentage: '-80%',
        color: Colors.green),
    StatItem(
        title: 'different artists',
        value: '141',
        percentage: '-54%',
        color: Colors.green),
    StatItem(
        title: 'hours streamed',
        value: '22',
        percentage: '-80%',
        color: Colors.green),
    StatItem(
        title: 'different albums',
        value: '186',
        percentage: '-54%',
        color: Colors.green),
    StatItem(
        title: 'days streamed',
        value: '0',
        percentage: '-100%',
        color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Minutes Listened Daily',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return Text('1 Dec',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 1:
                                    return Text(' ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 2:
                                    return Text(' ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 3:
                                    return Text('4 Dec',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 4:
                                    return Text(' ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 5:
                                    return Text(' ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  case 6:
                                    return Text('7 Dec',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16));
                                  default:
                                    return Text('',
                                        style: TextStyle(color: Colors.white));
                                }
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.white38, width: 0),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: Colors.greenAccent,
                            spots: [
                              FlSpot(0, 300),
                              FlSpot(1, 200),
                              FlSpot(2, 280),
                              FlSpot(3, 150),
                              FlSpot(4, 220),
                              FlSpot(5, 100),
                              FlSpot(6, 250),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Breakdown',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 200,
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 191, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 123, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 90, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 250, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 280, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 240, color: Colors.green)
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                                fromY: 0, toY: 190, color: Colors.green)
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  final stat = stats[index];
                  return StatCard(stat: stat);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatItem {
  final String title;
  final String value;
  final String percentage;
  final Color color;

  StatItem({
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
  });
}

class StatCard extends StatelessWidget {
  final StatItem stat;

  const StatCard({Key? key, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stat.value,
              style: TextStyle(
                color: stat.color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              stat.percentage,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              stat.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
