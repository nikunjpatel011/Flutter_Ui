import 'package:flutter/material.dart';

class BusinessSearchWidget
    extends
        StatefulWidget {
  final Function(
    String,
  )
  onSelect;

  const BusinessSearchWidget({
    super.key,
    required this.onSelect,
  });

  @override
  _BusinessSearchWidgetState createState() => _BusinessSearchWidgetState();
}

class _BusinessSearchWidgetState
    extends
        State<
          BusinessSearchWidget
        > {
  final TextEditingController _controller = TextEditingController();
  bool showDropdown = false;

  final List<
    Map<
      String,
      String
    >
  >
  mockResults = [
    {
      "title": "Rulcan’s House",
      "address": "Bhakti Nagar, Rajkot, Gujarat",
    },
    {
      "title": "Fitness Kickstart",
      "address": "Nagpur, Maharashtra, India",
    },
    {
      "title": "Manek Jewellers",
      "address": "Jamnagar, Gujarat, India",
    },
    {
      "title": "Maruti Hoziyari",
      "address": "Lohana Para, Rajkot, Gujarat",
    },
    {
      "title": "Vispan Traders",
      "address": "Andheri, Mumbai, Maharashtra",
    },
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        // SEARCH BOX
        GestureDetector(
          onTap: () {
            setState(
              () {
                showDropdown = true;
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                14,
              ),
              border: Border.all(
                color: const Color(
                  0xFFCED4DA,
                ),
              ),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Enter your business name",
                      border: InputBorder.none,
                    ),
                    onChanged:
                        (
                          value,
                        ) {
                          setState(
                            () {
                              showDropdown = true;
                            },
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        ),

        // DROPDOWN LIST
        if (showDropdown)
          Container(
            margin: const EdgeInsets.only(
              top: 8,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                14,
              ),
              color: Colors.white,
              border: Border.all(
                color: const Color(
                  0xFFCED4DA,
                ),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: mockResults.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    final item = mockResults[index];
                    return InkWell(
                      onTap: () {
                        widget.onSelect(
                          item["title"]!,
                        );
                        _controller.text = item["title"]!;
                        setState(
                          () {
                            showDropdown = false;
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    item["address"]!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
            ),
          ),
      ],
    );
  }
}
