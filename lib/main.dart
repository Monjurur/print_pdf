import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}




class Item {

  Item({

    required this.id,

    required this.name,

    required this.price,

    required this.description,

  });



  int id;

  String name;

  double price;

  String description;

}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {


  List<Item> _items = [];



  @override

  void initState() {

    super.initState();

    setState(() {

      _items = _generateItems();

    });

  }



  List<Item> _generateItems() {

    return List.generate(5, (int index) {

      return Item(

        id: index,

        name: 'Item $index',

        price: index * 1000.00,

        description: 'Details of item $index',

      );

    });

  }



  TableRow _buildTableRow(Item item) {

    return TableRow(

        key: ValueKey(item.id),

        decoration: BoxDecoration(

          color: Colors.lightBlueAccent,

        ),

        children: [

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.bottom,

            child: SizedBox(

              height: 50,

              child: Center(

                child: Text(item.id.toString()),

              ),

            ),

          ),

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.middle,

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.name),

            ),

          ),

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.middle,

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.price.toString()),

            ),

          ),

          TableCell(

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.description),

            ),

          ),

        ]

    );

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Woolha.com Flutter Tutorial'),

      ),

      body: Table(

        // border: TableBorder(

        //     bottom: BorderSide(color: Colors.red, width: 2),

        //     horizontalInside: BorderSide(color: Colors.red, width: 2),

        // ),

        // border: TableBorder.all(color: Colors.red, width: 2),

        border: TableBorder.symmetric(

          inside: BorderSide(color: Colors.blue, width: 2),

          //outside: BorderSide(color: Colors.red, width: 5),

        ),

        defaultVerticalAlignment: TableCellVerticalAlignment.baseline,

        defaultColumnWidth: IntrinsicColumnWidth(),

        columnWidths: const <int, TableColumnWidth> {

          0: const FixedColumnWidth(20),

          1: const FlexColumnWidth(3),

          2: const MaxColumnWidth(FlexColumnWidth(2), FractionColumnWidth(0.3)),

          3: const FixedColumnWidth(150),

        },

        // textDirection: TextDirection.rtl,

        textBaseline: TextBaseline.alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]

        children: _items.map((item) => _buildTableRow(item))

            .toList(),

      ),

    );

  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> headerColumn = ['Column 1', 'Column 2', 'Column 3'];
List<String> itemColumn = ['Rshim', 'Karim', 'Josim'];

int columnCount = 5;
double columnWidth = 100.0;

class _MyHomePageState extends State<MyHomePage> {

  Map<int, TableColumnWidth>? cnWidths;
  List<Item> _items = [];




  @override
  void initState() {
    setState(() {

      _items = _generateItems();

    });
    super.initState();
  }

  List<Item> _generateItems() {

    return List.generate(5, (int index) {

      return Item(

        id: index,

        name: 'Item $index',

        price: index * 1000.00,

        description: 'Details of item $index',

      );

    });

  }



  TableRow _buildTableRow(Item item) {

    return TableRow(

        key: ValueKey(item.id),

        decoration: BoxDecoration(

          color: Colors.lightBlueAccent,

        ),

        children: [

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.bottom,

            child: SizedBox(

              height: 50,

              child: Center(

                child: Text(item.id.toString()),

              ),

            ),

          ),

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.middle,

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.name),

            ),

          ),

          TableCell(

            verticalAlignment: TableCellVerticalAlignment.middle,

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.price.toString()),

            ),

          ),

          TableCell(

            child: Padding(

              padding: const EdgeInsets.all(5),

              child: Text(item.description),

            ),

          ),

        ]

    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Printing"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _createPdf,
                child:const Text(
                  'Create & Print PDF',
                ),
              ),
             const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _displayPdf,
                child: Text(
                  'Display PDF',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: generatePdf,
                child: Text(
                  'Generate Advanced PDF',
                ),
              ),
            ],
          ),
        ));
  }



  totalView( String total , String amount){
    pw.TableRow(
        children: [
          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Padding(padding: pw.EdgeInsets.all(3),
                  child:    pw.Text("$total: ",
                      style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                ),

              ]
          ),

          pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment
                  .end,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Padding(padding: pw.EdgeInsets.all(3),
                  child: pw.Text("$amount",
                      style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                ),

                //pw.Divider(thickness: 1)
              ]
          )
        ]
    );
  }

  /// create PDF & print it
  void _createPdf() async {
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          if (context.pageNumber == 8) {
            // return null;
          }
          return pw.Column(children: [
            pw.Container(
                alignment: pw.Alignment.center,
                margin: pw.EdgeInsets.only(bottom: 3.0),
                padding: pw.EdgeInsets.only(bottom: 3.0),
                decoration: pw.BoxDecoration(
                  /* border: pw.BoxBorder(
                      bottom: true, width: 0.5, color: PdfColors.grey)*/
                ),
                child: pw.Column(children: [
                  pw.Text('HYPOS',
                      style: pw.TextStyle(
                          fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Sector-7,Uttara,Dhaka',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('Phone: 01758351395',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('BIN NO: 456789098765434567',
                      style: pw.TextStyle(
                          fontSize: 13, fontWeight: pw.FontWeight.bold)),
                ])),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Phone: 01758351395',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('Date: 05/01/2023  Time: 12:07',
                      style: pw.TextStyle(fontSize: 10)),
                ]),
          ]);
        },
        /*  footer: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 1.0 ),
              child: pw.Text('Page ${context.pageNumber} of ${context.pagesCount}',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },*/
        build: (pw.Context context) => <pw.Widget>[
          pw.Header(
              level: 0,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: <pw.Widget>[
                    pw.Text(
                      'Invoice No: POS#9876545678',
                    ),
                    // pw.PdfLogo()
                  ])),
          pw.Table(
            border: pw.TableBorder.all(),
              children: [

               // for (var i = 0; i < reportedItems.length; i++)
                  pw.TableRow(
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment
                                .center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Padding(padding: pw.EdgeInsets.all(3),
                                child:    pw.Text("Rosemco-Katla Big Fish -200g ",
                                    style: pw.TextStyle(fontSize: 10)),
                              ),

                             // pw.Divider(thickness: 1)
                            ]
                        ),
                       /* pw.Container(
                          //height: MediaQuery.of().size.height,
                          color: PdfColors.cyan,
                          alignment: pw.Alignment.center,
                          child: pw.Text("1",
                              style: const pw.TextStyle(fontSize: 10)),
                        ),*/
                       // pw.Text("1",style: pw.TextStyle()),


                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [

                              pw.Text("1",
                                  style: const pw.TextStyle(fontSize: 10)),
                              //pw.Divider(thickness: 1)
                            ]
                        ),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment
                                .center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text("1",
                                  style: pw.TextStyle(fontSize: 10)),
                              //pw.Divider(thickness: 1)
                            ]
                        )
                      ]
                  ),



              ],
            columnWidths: {
              0: pw.FlexColumnWidth(8),
              1:pw. FlexColumnWidth(3),
              2:pw. FlexColumnWidth(2),
            },

          ),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
      pw.TableRow(
          children: [
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Padding(padding: pw.EdgeInsets.all(3),
                    child:    pw.Text("Total: ",
                        style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  ),

                ]
            ),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment
                    .end,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Padding(padding: pw.EdgeInsets.all(3),
                    child: pw.Text("123",
                        style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                  ),

                  //pw.Divider(thickness: 1)
                ]
            )
          ]
      ),



            ],
            columnWidths: {
              0: pw.FlexColumnWidth(7),

              1:pw. FlexColumnWidth(3),
            },

          ),
          /*  pw.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              ['Rshim', 'Karim'],
              ['Rshim', 'Karim'],
            ],
            //cellAlignment: pw.Alignment.Center,
           *//* headerDecoration: const pw.BoxDecoration(
              color: PdfColors.grey,
            ),*//*
            headerHeight: 30,
            cellHeight: 40,
              *//*columnWidths: cnWidths,*//*
          ),*/



          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 10),
            child: pw.Container(
              child: pw.Row(children: [
                pw.Text("Get Free Home Delivery ",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("(masalaBazar.com.bd)",
                    style: const pw.TextStyle(fontSize: 10))
              ]),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 3),
            child: pw.Container(
              child: pw.Row(children: [
                pw.Text("Tel: 0987654567890,",
                    style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                pw.Text(" Mobile:01765678976",
                    style:  pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold))
              ]),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 5),
            child: pw.Container(
              child: pw.Row(children: [
                pw.Text("Note:",
                    style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                pw.Text("Purchases Of Defected Item Must be Exchange By 72 Hour With Invoice.",
                    style: const pw.TextStyle(fontSize: 12))
              ]),
            ),
          ),
          pw.Container(
            child: pw.Text("(Condition Applicable)",
                style:const pw.TextStyle(fontSize: 8)),
          ),
        ]));

    /// print the document using the iOS or Android print service:
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }




  /// create PDF & print it
  void _createPdf1() async {
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          if (context.pageNumber == 8) {
            // return null;
          }
          return pw.Column(children: [
            pw.Container(
                alignment: pw.Alignment.center,
                margin: pw.EdgeInsets.only(bottom: 3.0),
                padding: pw.EdgeInsets.only(bottom: 3.0),
                decoration: pw.BoxDecoration(
                    /* border: pw.BoxBorder(
                      bottom: true, width: 0.5, color: PdfColors.grey)*/
                    ),
                child: pw.Column(children: [
                  pw.Text('HYPOS',
                      style: pw.TextStyle(
                          fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  pw.Text('Sector-7,Uttara,Dhaka',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('Phone: 01758351395',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('BIN NO: 456789098765434567',
                      style: pw.TextStyle(
                          fontSize: 13, fontWeight: pw.FontWeight.bold)),
                ])),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Phone: 01758351395',
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text('Date: 05/01/2023  Time: 12:07',
                      style: pw.TextStyle(fontSize: 10)),
                ]),
          ]);
        },
        /*  footer: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 1.0 ),
              child: pw.Text('Page ${context.pageNumber} of ${context.pagesCount}',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },*/
        build: (pw.Context context) => <pw.Widget>[
              pw.Header(
                  level: 0,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Text(
                          'Invoice No: POS#9876545678',
                        ),
                        // pw.PdfLogo()
                      ])),
              pw.Table.fromTextArray(
                context: context,
                data: <List<String>>[
                  headerColumn,
                  itemColumn,
                  itemColumn,
                ],
                //cellAlignment: pw.Alignment.Center,
                headerDecoration:  pw.BoxDecoration(
                  color: PdfColors.grey,
                ),
                headerHeight: 30,
                cellHeight: 40,
               /*  columnWidths:pw. <int, TableColumnWidth> {

                   0: const FixedColumnWidth(20),

                   1: const FlexColumnWidth(3),

                   2: const MaxColumnWidth(FlexColumnWidth(2), FractionColumnWidth(0.3)),

                 }*/

              ),

        /*  pw.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              ['Rshim', 'Karim'],
              ['Rshim', 'Karim'],
            ],
            //cellAlignment: pw.Alignment.Center,
           *//* headerDecoration: const pw.BoxDecoration(
              color: PdfColors.grey,
            ),*//*
            headerHeight: 30,
            cellHeight: 40,
              *//*columnWidths: cnWidths,*//*
          ),*/



              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 10),
                child: pw.Container(
                  child: pw.Row(children: [
                    pw.Text("Get Free Home Delivery ",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("(masalaBazar.com.bd)",
                        style: const pw.TextStyle(fontSize: 10))
                  ]),
                ),
              ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 3),
            child: pw.Container(
              child: pw.Row(children: [
                pw.Text("Tel: 0987654567890,",
                    style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                pw.Text(" Mobile:01765678976",
                    style:  pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold))
              ]),
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 5),
            child: pw.Container(
              child: pw.Row(children: [
                pw.Text("Note:",
                    style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                pw.Text("Purchases Of Defected Item Must be Exchange By 72 Hour With Invoice.",
                    style: const pw.TextStyle(fontSize: 12))
              ]),
            ),
          ),
           pw.Container(
              child: pw.Text("(Condition Applicable)",
                  style:const pw.TextStyle(fontSize: 8)),
            ),
            ]));

    /// print the document using the iOS or Android print service:
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  /// display a pdf document.
  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'Hello eclectify Enthusiast',
              style: pw.TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );

    /// open Preview Screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(doc: doc),
        ));
  }

  /// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
  void _convertPdfToImages(pw.Document doc) async {
    await for (var page
        in Printing.raster(await doc.save(), pages: [0, 1], dpi: 72)) {
      final image = page.toImage(); // ...or page.toPng()
      print(image);
    }
  }

  /// print an existing Pdf file from a Flutter asset
  void _printExistingPdf() async {
    // import 'package:flutter/services.dart';
    final pdf = await rootBundle.load('assets/document.pdf');
    await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
  }

  /// more advanced PDF styling
  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  void generatePdf() async {
    const title = 'eclectify Demo';
    await Printing.layoutPdf(onLayout: (format) => _generatePdf(format, title));
  }
}

class PreviewScreen extends StatelessWidget {
  final pw.Document doc;

  const PreviewScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: Text("Preview"),
      ),
      body: PdfPreview(
        build: (format) => doc.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}
