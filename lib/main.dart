import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:math' as math;

void main() => runApp(const NextGenEnterpriseHub());

class NextGenEnterpriseHub extends StatelessWidget {
  const NextGenEnterpriseHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nexus Enterprise Hub",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF10B981),
          surface: const Color(0xFF161B26),
          error: Color(0xFFEF4444),
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          color: Color(0xFF131824),
          elevation: 4,
        ),
      ),
      home: const QuantumGatewayPage(),
    );
  }
}

/* --- ADVANCED TELEMETRY SYSTEMS & LIVE SECURE LEDGER --- */
class SystemTelemetry {
  static final List<String> rollingLogs = [
    "--- NEXUS OPERATIONS ENGINE CORE SECURE BOOT ---",
    "[SYS] SECURE SHANDSHAKE: Initializing cryptographic token handshake vector...",
    "[NET] GATEWAY: Connected to secure edge firewall node @ IP: 192.168.42.1",
    "[NET] INTEGRITY: Packet loss 0.00% // DNS resolution verified via TLS pipeline.",
  ];
  static VoidCallback? onLogDispatched;

  static void record(String subsystem, String message) {
    final timeStamp = DateTime.now().toString().substring(11, 19);
    rollingLogs.add("[$timeStamp] [$subsystem] $message");
    if (onLogDispatched != null) onLogDispatched!();
  }
}

/* --- MODULE 1: ZERO-TRUST REGEX BOUNDARY GATEWAY --- */
class QuantumGatewayPage extends StatefulWidget {
  const QuantumGatewayPage({super.key});

  @override
  State<QuantumGatewayPage> createState() => _QuantumGatewayPageState();
}

class _QuantumGatewayPageState extends State<QuantumGatewayPage> {
  final _operatorCtrl = TextEditingController();
  final _passcodeCtrl = TextEditingController();
  bool _hideSecurityKey = true;

  // SYSTEM UPGRADE: Multi-tiered High-Entropy Alphanumeric Pattern Matching
  List<String> _evaluateSecurityEntropy(String securityKey) {
    List<String> violations = [];
    if (securityKey.length < 8) violations.add("Length constraint fault (Requires 8+ Chars)");
    if (!securityKey.contains(RegExp(r'[A-Z]'))) violations.add("Missing upper-case matrix bit");
    if (!securityKey.contains(RegExp(r'[0-9]'))) violations.add("Missing low-level integer byte");
    if (!securityKey.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) violations.add("Missing cryptographic special hash token");
    return violations;
  }

  void _authenticateSession() {
    final userToken = _operatorCtrl.text.trim();
    final secureKey = _passcodeCtrl.text;

    if (userToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Colors.amber, content: Text("Operator Identifier node required.")),
      );
      return;
    }

    final securityViolations = _evaluateSecurityEntropy(secureKey);

    if (securityViolations.isEmpty) {
      SystemTelemetry.record("AUTH", "TOKEN CONFIRMED: Session allocated for node operator: ${userToken.toUpperCase()}");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuantumDashboardHub(operatorId: userToken)),
      );
    } else {
      // Audit log prints exact corporate security policies violated
      for (var violation in securityViolations) {
        SystemTelemetry.record("SEC_WARN", "ZERO-TRUST REJECTION: $violation from client address vector.");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFEF4444),
          content: Text("REJECTED: ${securityViolations.first} (See System Terminal logs for details)"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF060913), Color(0xFF0F172A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 460,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.cyan.shade900.withValues(alpha: 0.5))),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.cyan.withValues(alpha: 0.08),
                      child: const Icon(Icons.lock_open, size: 40, color: Color(0xFF00E5FF)),
                    ),
                    const SizedBox(height: 20),
                    const Text("NEXUS SYSTEM GATEWAY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.white)),
                    Text("SECURE WORKSPACE INTERFACE PROTOCOL", style: TextStyle(fontSize: 10, color: Colors.grey.shade500, letterSpacing: 1)),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _operatorCtrl,
                      decoration: InputDecoration(prefixIcon: const Icon(Icons.person_outline), labelText: "Operator Node ID", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: _passcodeCtrl,
                      obscureText: _hideSecurityKey,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key_outlined),
                        labelText: "Cryptographic Passkey",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        suffixIcon: IconButton(
                          icon: Icon(_hideSecurityKey ? Icons.visibility_off : Icons.visibility),
                          onPressed: () => setState(() => _hideSecurityKey = !_hideSecurityKey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00E5FF),
                        foregroundColor: const Color(0xFF060913),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _authenticateSession,
                      child: const Text("INITIALIZE SUITE LINK", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* --- MODULE 2: HIGH-LEVEL EXECUTIVE TELEMETRY DASHBOARD --- */
class QuantumDashboardHub extends StatefulWidget {
  final String operatorId;
  const QuantumDashboardHub({super.key, required this.operatorId});

  @override
  State<QuantumDashboardHub> createState() => _QuantumDashboardHubState();
}

class _QuantumDashboardHubState extends State<QuantumDashboardHub> {
  static final List<Map<String, String>> _globalEnterpriseDirectory = [
    {"name": "Main Administration Command", "phone": "0802666222"},
    {"name": "ISE Systems Core Lab", "phone": "9900112233"},
    {"name": "Emergency Operations Center", "phone": "911008012"},
    {"name": "Niroop Project Lead Terminal", "phone": "7022897224"}
  ];

  int _aiAgentExecutionCounter = 0;

  // SYSTEM UPGRADE STATE VARIABLES: Active Infrastructure Monitor Metrics
  late Timer _telemetryClockTimer;
  final _randomEngine = math.Random();
  int _apiLatencyMs = 24;
  double _serverCpuLoadPercent = 8.5;

  @override
  void initState() {
    super.initState();
    SystemTelemetry.onLogDispatched = () {
      if (mounted) setState(() {});
    };

    // SYSTEM UPGRADE: Background Thread Async Timer simulating ongoing server load checking
    _telemetryClockTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      setState(() {
        _apiLatencyMs = 15 + _randomEngine.nextInt(35); // Bounces dynamically between 15ms and 50ms
        _serverCpuLoadPercent = 5.0 + (_randomEngine.nextDouble() * 12.0); // Bounces between 5% and 17%
      });
    });
  }

  @override
  void dispose() {
    _telemetryClockTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("NEXUS ENTERPRISE HUB // OPERATOR: ${widget.operatorId.toUpperCase()}"),
        centerTitle: true,
        backgroundColor: const Color(0xFF131824),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        shape: const Border(bottom: BorderSide(color: Colors.white10, width: 1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Workspace UI Frame
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("LIVE TELEMETRY PERFORMANCE MONITOR", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Color(0xFF00E5FF))),
                  const SizedBox(height: 16),

                  // UPGRADED METRIC GRID LAYER (Includes dynamic network data tracking indicators)
                  Row(
                    children: [
                      _buildMetricCard("DIRECTORY STACK CAPACITY", "${_globalEnterpriseDirectory.length} Allocated Nodes", Icons.dns_outlined, theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      _buildMetricCard("AI PARSER Dispatches", "$_aiAgentExecutionCounter Completed Tasks", Icons.psychology_outlined, theme.colorScheme.secondary),
                      const SizedBox(width: 12),
                      _buildMetricCard("API BUS RESPONSE LATENCY", "${_apiLatencyMs}ms (Active Node Sync)", Icons.speed_outlined, Colors.purpleAccent),
                      const SizedBox(width: 12),
                      _buildMetricCard("SERVER CORE CPU CORE LOAD", "${_serverCpuLoadPercent.toStringAsFixed(1)}% Operational Capacity", Icons.memory_outlined, Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text("INTEGRATED FUNCTIONAL FRAMEWORK MODULES", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.white70)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildNavigationCard(
                            "SMART DIALER CONSOLE", "Communications Channel Engine and Directory Management.",
                            Icons.contact_phone_outlined, theme.colorScheme.primary,
                            EnterpriseRegistryPage(directoryStack: _globalEnterpriseDirectory, onRegistryModified: () => setState(() {}))
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildNavigationCard(
                            "AI COMMAND ASSISTANT", "Intelligent NLP Voice Command Interceptor and Automation Engine.",
                            Icons.interpreter_mode_outlined, theme.colorScheme.secondary,
                            AiAgentRouterPage(
                              directoryDatabase: _globalEnterpriseDirectory,
                              onActionTriggered: () {
                                setState(() {
                                  _aiAgentExecutionCounter++;
                                  // Instantly trigger a latency burst simulation on network use
                                  _apiLatencyMs += 45;
                                });
                              },
                              onResetLogs: () {
                                setState(() {
                                  SystemTelemetry.rollingLogs.clear();
                                  SystemTelemetry.record("CORE", "System monitor tracks purged by administrative voice action.");
                                });
                              },
                            )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),

            // Right Side Scrolling Terminal Ledger
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.white10)),
                color: const Color(0xFF060913),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.terminal, color: Color(0xFF10B981), size: 18),
                          SizedBox(width: 10),
                          Text("LIVE SYSTEM MONITOR LOGS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.1)),
                        ],
                      ),
                      const Divider(color: Colors.white10, height: 24),
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          itemCount: SystemTelemetry.rollingLogs.length,
                          itemBuilder: (context, index) {
                            final inverseIdx = SystemTelemetry.rollingLogs.length - 1 - index;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                SystemTelemetry.rollingLogs[inverseIdx],
                                style: const TextStyle(color: Color(0xFF10B981), fontFamily: 'monospace', fontSize: 11, height: 1.4),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, Color dynamicAccentColor) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14), side: const BorderSide(color: Colors.white10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 9, letterSpacing: 0.5, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
                  Icon(icon, color: dynamicAccentColor, size: 16),
                ],
              ),
              const SizedBox(height: 12),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'monospace')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(String title, String description, IconData visualIcon, Color themeAccentColor, Widget endpointPage) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.white10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => endpointPage)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(visualIcon, size: 36, color: themeAccentColor),
              const SizedBox(height: 20),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              const SizedBox(height: 8),
              Text(description, style: TextStyle(fontSize: 12, color: Colors.grey.shade400, height: 1.5)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Initialize Task", style: TextStyle(fontSize: 11, color: themeAccentColor, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                  const SizedBox(width: 6),
                  Icon(Icons.launch, size: 12, color: themeAccentColor)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* --- MODULE 3: COMMUNICATIVE DIRECTORY MANAGEMENT ENGINE --- */
class EnterpriseRegistryPage extends StatefulWidget {
  final List<Map<String, String>> directoryStack;
  final VoidCallback onRegistryModified;
  const EnterpriseRegistryPage({super.key, required this.directoryStack, required this.onRegistryModified});

  @override
  State<EnterpriseRegistryPage> createState() => _EnterpriseRegistryPageState();
}

class _EnterpriseRegistryPageState extends State<EnterpriseRegistryPage> {
  final _identityCtrl = TextEditingController();
  final _telecomCtrl = TextEditingController();
  final _searchFilterCtrl = TextEditingController();
  String _activeQueryPattern = "";

  void _commitRegistryNode() {
    final cleanIdentity = _identityCtrl.text.trim();
    final cleanTelecom = _telecomCtrl.text.trim();

    if (cleanIdentity.isEmpty || cleanTelecom.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Color(0xFFEF4444), content: Text("Payload Error: Required registry fields cannot be empty.")),
      );
      return;
    }

    setState(() {
      widget.directoryStack.add({"name": cleanIdentity, "phone": cleanTelecom});
    });

    SystemTelemetry.record("DATA_SYNC", "Memory Stack Allocated: Successfully bound entry record token: [$cleanIdentity | $cleanTelecom]");
    widget.onRegistryModified();
    _identityCtrl.clear();
    _telecomCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final runtimeFilteredRecords = widget.directoryStack.where((element) {
      final matchName = element["name"]!.toLowerCase();
      final matchPhone = element["phone"]!.toLowerCase();
      return matchName.contains(_activeQueryPattern) || matchPhone.contains(_activeQueryPattern);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Directory Telecom Link System"), backgroundColor: const Color(0xFF131824)),
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.white10)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Append Identity Matrix Node", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF00E5FF))),
                      const SizedBox(height: 24),
                      TextField(controller: _identityCtrl, decoration: const InputDecoration(labelText: "Client Identifier Name", prefixIcon: Icon(Icons.badge_outlined), border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: _telecomCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: "Terminal Callback Number", prefixIcon: Icon(Icons.phone_outlined), border: OutlineInputBorder())),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF10B981), foregroundColor: const Color(0xFF060913), padding: const EdgeInsets.symmetric(vertical: 16)),
                              icon: const Icon(Icons.call),
                              label: const Text("DIAL OUT"),
                              onPressed: () {
                                if (_telecomCtrl.text.isNotEmpty) {
                                  SystemTelemetry.record("NET_OUT", "Triggering hardware proxy outbound signal trunk to address: ${_telecomCtrl.text}");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(backgroundColor: Color(0xFF10B981), content: Text("Outgoing Route Established Successfully")),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan.shade700, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
                              icon: const Icon(Icons.save),
                              label: const Text("SAVE ENTRY"),
                              onPressed: _commitRegistryNode,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(width: 1, color: Colors.white10),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchFilterCtrl,
                    onChanged: (value) => setState(() => _activeQueryPattern = value.trim().toLowerCase()),
                    decoration: InputDecoration(
                      labelText: "Filter Registry Index Engine...",
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: _searchFilterCtrl.text.isNotEmpty ? IconButton(icon: const Icon(Icons.clear), onPressed: () => setState(() { _searchFilterCtrl.clear(); _activeQueryPattern = ""; })) : null,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Matching Ledger System Database Records (${runtimeFilteredRecords.length})", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey, letterSpacing: 0.5)),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: runtimeFilteredRecords.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final record = runtimeFilteredRecords[index];
                        return Card(
                          margin: EdgeInsets.zero,
                          color: const Color(0xFF161B26),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.white10)),
                          child: ListTile(
                            leading: CircleAvatar(backgroundColor: Colors.cyan.withValues(alpha: 0.05), child: const Icon(Icons.person, color: Color(0xFF00E5FF), size: 18)),
                            title: Text(record["name"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            subtitle: Text(record["phone"]!, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Colors.grey)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.phone, color: Color(0xFF10B981)),
                                  onPressed: () {
                                    SystemTelemetry.record("NET_OUT", "Opening dynamic voice gateway out to cluster node target: ${record["name"]}");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(backgroundColor: const Color(0xFF10B981), content: Text("Routing to channel: ${record["name"]}")),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_forever, color: Color(0xFFEF4444)),
                                  onPressed: () {
                                    setState(() {
                                      widget.directoryStack.remove(record);
                                    });
                                    SystemTelemetry.record("DATA_SYNC", "WIPING REGISTER NODE BLOCK: Evicted identity index mapping allocation for label: ${record["name"]}");
                                    widget.onRegistryModified();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* --- MODULE 4: INTELLIGENT AUDIO COMMAND CONSOLE ENGINE --- */
class AiAgentRouterPage extends StatefulWidget {
  final List<Map<String, String>> directoryDatabase;
  final VoidCallback onActionTriggered;
  final VoidCallback onResetLogs;

  const AiAgentRouterPage({
    super.key,
    required this.directoryDatabase,
    required this.onActionTriggered,
    required this.onResetLogs,
  });

  @override
  State<AiAgentRouterPage> createState() => _AiAgentRouterPageState();
}

class _AiAgentRouterPageState extends State<AiAgentRouterPage> {
  final FlutterTts _nativeTtsPipelineInstance = FlutterTts();
  final _cognitiveTerminalCtrl = TextEditingController(text: "dial 7022897224");

  double _voiceTempoMultiplierValue = 1.0;
  double _voicePitchFrequencyValue = 1.0;
  String _agentInternalProcessingFeedback = "Agent Standby (Idle)";

  void _executeSemanticParserPipeline(String rawStreamPayload) async {
    final algorithmicCleanInput = rawStreamPayload.trim().toLowerCase();
    String syntheticSpeechOutputString = "";

    setState(() { _agentInternalProcessingFeedback = "Parsing Command Logic..."; });

    if (algorithmicCleanInput.startsWith("dial ")) {
      final terminalAddressSequence = rawStreamPayload.substring(5).trim();
      SystemTelemetry.record("AI_AGENT", "STRING PARSE DETECTED: [Intent: DIAL] Routing voice hardware sequence out to link target: $terminalAddressSequence.");
      syntheticSpeechOutputString = "Executing systemic dial matrix out to terminal endpoint sequence $terminalAddressSequence.";

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: Color(0xFF10B981), content: Text("🔄 Agent Executing Auto-Dial")),
      );
    }
    else if (algorithmicCleanInput.startsWith("call ")) {
      final patternQuerySubstring = algorithmicCleanInput.substring(5).trim();
      SystemTelemetry.record("AI_AGENT", "STRING PARSE DETECTED: [Intent: LOOKUP] Commencing database crawl filter for label token: '$patternQuerySubstring'.");

      Map<String, String>? structuralSearchNodeMatch;
      for (var asset in widget.directoryDatabase) {
        if (asset["name"]!.toLowerCase().contains(patternQuerySubstring)) {
          structuralSearchNodeMatch = asset;
          break;
        }
      }

      if (structuralSearchNodeMatch != null) {
        final derivedTargetPhone = structuralSearchNodeMatch["phone"];
        final derivedTargetName = structuralSearchNodeMatch["name"];
        SystemTelemetry.record("AI_AGENT", "SEMANTIC RESOLUTION SUCCESS: Unified trunk link set to target node: $derivedTargetName ($derivedTargetPhone).");
        syntheticSpeechOutputString = "Contact located. Connection line routed to $derivedTargetName.";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: const Color(0xFF00E5FF), content: Text("📞 Agent Connecting: $derivedTargetName")),
        );
      } else {
        SystemTelemetry.record("AI_AGENT", "SEMANTIC RESOLUTION ERROR: Pointer crawl mapping returned void. Token mismatch.");
        syntheticSpeechOutputString = "Directory lookup failed. No contact matches that descriptor name.";
      }
    }
    else if (algorithmicCleanInput == "clear logs" || algorithmicCleanInput == "flush monitor") {
      SystemTelemetry.record("AI_AGENT", "STRING PARSE DETECTED: [Intent: TERMINAL_EVICTION] Wiping diagnostic cache loops.");
      syntheticSpeechOutputString = "Executing absolute diagnostic activity monitor log purge sequence.";
      widget.onResetLogs();
    }
    else {
      SystemTelemetry.record("AI_AGENT", "FALLBACK PROTOCOL ENGAGED: Unmapped character matrix detected. Relaying standard payload straight to synthesis hardware pipelines.");
      syntheticSpeechOutputString = rawStreamPayload;
    }

    try {
      await _nativeTtsPipelineInstance.setSpeechRate(_voiceTempoMultiplierValue * 0.5);
      await _nativeTtsPipelineInstance.setPitch(_voicePitchFrequencyValue);
      await _nativeTtsPipelineInstance.speak(syntheticSpeechOutputString);

      setState(() { _agentInternalProcessingFeedback = "Task Complete // Stream Closed"; });
      widget.onActionTriggered();
    } catch (hardwareDriverFaultException) {
      setState(() { _agentInternalProcessingFeedback = "Hardware Fault Exception"; });
      SystemTelemetry.record("FATAL_ERR", "Hardware channel interop exception flag raised during voice payload transmission loop.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nexus AI Agent Control Command"), backgroundColor: const Color(0xFF131824)),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.white10)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: const Color(0xFF060913), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.cyan.withValues(alpha: 0.2))),
                      child: Row(
                        children: [
                          const Icon(Icons.psychology, color: Color(0xFF00E5FF)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text("Agent Diagnostics: $_agentInternalProcessingFeedback", style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00E5FF), fontSize: 12, fontFamily: 'monospace')),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity, padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: const Color(0xFF161B26), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("💡 SYSTEM INTENT VOICE MACROS COMMANDS:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey, letterSpacing: 0.5)),
                          SizedBox(height: 6),
                          Text("• 'dial [phone_number]' ➔ Triggers automatic system dialing route.", style: TextStyle(fontSize: 11, height: 1.4)),
                          Text("• 'call [contact_name]' ➔ Searches database and connects automatically.", style: TextStyle(fontSize: 11, height: 1.4)),
                          Text("• 'clear logs' ➔ Remotely purges system monitor rolling history.", style: TextStyle(fontSize: 11, height: 1.4)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _cognitiveTerminalCtrl,
                      maxLines: 2,
                      decoration: const InputDecoration(labelText: "Command Console Input String Stream", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 100, child: Text("Tempo Rate:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                        Expanded(
                          child: Slider(
                            value: _voiceTempoMultiplierValue, min: 0.5, max: 2.0, divisions: 6,
                            activeColor: const Color(0xFF00E5FF),
                            label: "${_voiceTempoMultiplierValue}x Speed",
                            onChanged: (val) => setState(() => _voiceTempoMultiplierValue = val),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 100, child: Text("Voice Pitch:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
                        Expanded(
                          child: Slider(
                            value: _voicePitchFrequencyValue, min: 0.5, max: 2.0, divisions: 6,
                            activeColor: const Color(0xFF00E5FF),
                            label: "Freq Lvl $_voicePitchFrequencyValue",
                            onChanged: (val) => setState(() => _voicePitchFrequencyValue = val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        backgroundColor: const Color(0xFF00E5FF), foregroundColor: const Color(0xFF060913),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        if (_cognitiveTerminalCtrl.text.isNotEmpty) {
                          _executeSemanticParserPipeline(_cognitiveTerminalCtrl.text);
                        }
                      },
                      icon: const Icon(Icons.bolt, size: 22),
                      label: const Text("DISPATCH COMMAND INTERCEPTOR", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}