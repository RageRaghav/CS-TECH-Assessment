// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cs_tech_assessment/services/list_services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cs_tech_assessment/widgets/sidebar.dart';

class PieChartScreen extends StatefulWidget {
  static const String routeName = '/chart-screen';
  final String username;
  final String email;
  final String userID;

  const PieChartScreen({
    Key? key,
    required this.username,
    required this.email,
    required this.userID,
  }) : super(key: key);

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  int touchedIndex = -1;

  // Variables to store API response data
  int pending = 0;
  int done = 0;
  int scheduled = 0;
  int totalCalls = 0;

  @override
  void initState() {
    super.initState();
    get_list(widget.userID);
  }

  get_list(String userID) async {
    final res = await ListServices.get_list(context: context, userID: userID);
    if (res != null) {
      get_list_details(res['_id']);
    }
  }

  get_list_details(String listID) async {
    final res = await ListServices.get_list_details(
      context: context,
      listID: listID,
    );

    if (res != null) {
      setState(() {
        pending = res['pending'] ?? 0;
        done = res['called'] ?? 0;
        scheduled = res['rescheduled'] ?? 0;
        totalCalls = (res['calls'] as List).length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebar(email: widget.email, username: widget.username),
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Summary Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Test List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '$totalCalls',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'CALLS',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Pie Chart
              Center(
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!
                                .touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 80,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Status Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatusCard(
                    context,
                    label: 'Pending',
                    count: pending,
                    backgroundColor: Colors.orange.shade100,
                    labelColor: Colors.black, // Set label text color to black
                    countColor: Colors.black, // Set count text color to black
                  ),
                  _buildStatusCard(
                    context,
                    label: 'Done',
                    count: done,
                    backgroundColor: Colors.green.shade100,
                    labelColor: Colors.black, // Set label text color to black
                    countColor: Colors.black, // Set count text color to black
                  ),
                  _buildStatusCard(
                    context,
                    label: 'Schedule',
                    count: scheduled,
                    backgroundColor: Colors.deepPurple.shade100,
                    labelColor: Colors.black, // Set label text color to black
                    countColor: Colors.black, // Set count text color to black
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // Call Now Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Start Calling Action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Start Calling Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Pie chart sections based on fetched data
  List<PieChartSectionData> showingSections() {
    final data = [pending, done, scheduled];
    final colors = [
      Colors.orange.shade600,
      Colors.blue.shade700,
      Colors.deepPurple.shade400,
    ];

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

      return PieChartSectionData(
        color: colors[i],
        value: data[i].toDouble(),
        title: '',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 146, 115, 115),
          shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      );
    });
  }

  /// Custom widget for status cards
  Widget _buildStatusCard(
    BuildContext context, {
    required String label,
    required int count,
    required Color backgroundColor,
    required Color labelColor, // New parameter for label color
    required Color countColor, // New parameter for count color
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: labelColor, // Use the new labelColor
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '$count Calls',
              style: TextStyle(
                color: countColor, // Use the new countColor
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}