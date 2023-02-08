import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final image =  imageFromAssetBundle('assets/image.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Printing"),
      ),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _createPdf,
              child: Text('Create & Print PDF',),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _displayPdf,
              child: Text('Display PDF',),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: generatePdf,
              child: Text('Generate Advanced PDF',),
            ),
          ],
        ),
      )
    );
  }






  /// create PDF & print it
  void _createPdf() async {
    final doc = pw.Document();

    /// for using an image from assets
     final image = await imageFromAssetBundle('assets/flutter.png');

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(child:pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children:[
            pw.Text("Hello Fahim",style: pw.TextStyle(fontSize: 50)),
            //pw.FlutterLogo(),
                pw.Image(image),
          ]),);// Center
        },
      ),
    ); // Page



    /*doc.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          ); // Center
        }));*/

    /// print the document using the iOS or Android print service:
    //await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

  await  Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
          format: format,
          html:  """
           <html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./main.css" />
    <title>Document</title>
  </head>
  <body>
    <header style="text-align: center; margin-inline: auto; width: 800px">
      <h1 style="margin-bottom: 5px">HYPOS</h1>
      <div class="address">
        <p style="margin-block: 0px">Sector-7, Uttara, Dhaka</p>
        <p style="margin-block: 0px">Phone: 01700000000</p>
      </div>
      <h3 style="margin-bottom: 0px; margin-top: 12px; line-height: 2px">
        <span>BIN NO:</span> 894903247123120
      </h3>
      <p
        style="
          margin-bottom: 0px;
          margin-top: 24px;
          text-align: left;
          margin-left: 0px;
        "
      >
        <strong>Served By:</strong><span> Mamun</span>
      </p>
      <div style="display: flex; justify-content: end; line-height: 2px">
        <p style="margin-right: 10px; margin-top: 14px">
          <strong>Date:</strong><span> 05/11/2022</span>
        </p>
        <p style="margin-top: 14px">
          <strong>Time:</strong><span> 12:05</span>
        </p>
      </div>
      <h3 style="text-align: left; line-height: 0px; margin-top: 0px">
        <span>Invoice No:</span> POS#231241412
      </h3>
    </header>
   
    <table
      style="
        margin-inline: auto;
        font-size: 12px;
        width: 800px;
        border: 1px solid #000;
        border-collapse: collapse;
      "
    >
      <tr>
        <th
          style="
            color: #000;
            border-bottom: 2px solid #000;
            padding: 5px;
            text-align: left;
          "
        >
          Products
        </th>
        <th
          style="
            color: #000;
            border-bottom: 2px solid #000;
            text-align: right;
            padding: 3px;
          "
        >
          Qty
        </th>
        <th
          style="
            color: #000;
            border-bottom: 2px solid #000;
            text-align: right;
            padding: 3px;
          "
        >
          Rate
        </th>
        <th
          style="
            color: #000;
            border-bottom: 2px solid #000;
            text-align: right;
            padding: 3px;
          "
        >
          Amount
        </th>
      </tr>
      <tr>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
          "
          class="product-title"
          colspan="1"
        >
          <strong>Rosemco - Katla Fish Big Size - 2000 g</strong>
          <p style="line-height: 0px">
            <span>S/N: PRD049534535252</small>
            <span>&nbsp;&nbsp;ExpDate: 23/12/2023</small>
          </p>
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
        >
          1.00
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
        >
          300.00
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
        >
          300.00
        </td>
      </tr>
      
      <tr>
        <td
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          <strong>Total:</strong>
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
          class=""
        >
          <strong>657.80</strong>
        </td>
      </tr>

      <tr>
        <td
          colspan="2"
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          Total VAT %:
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
        >
          5.77
        </td>
      </tr>
      <tr>
        <td
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          <strong>Total Discount:</strong>
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
        >
          <strong>50.04</strong>
        </td>
      </tr>
      <tr>
        <td
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          <strong>Net Amount:</strong>
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
        >
          <strong>9,481.00</strong>
        </td>
      </tr>
      <tr>
        <td
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          Pay Type:
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
        >
          Card
        </td>
      </tr>

      <tr>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
          "
          colspan="4"
        >
          In Words: Nine Thousand Four hundred Eight One and Seventy One Paisa
          Only
        </td>
      </tr>

      <tr>
        <td
          style="
            border-block: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          Paid Amount:
        </td>
        <td
          style="
            border-bottom: 1px solid gray;
            padding: 3px;
            box-sizing: border-box;
            text-align: right;
          "
          colspan="2"
        >
          <strong> 9,824.00</strong>
        </td>
      </tr>
      <tr>
        <td
          style="
            border-top: 1px solid gray;
            border-right: 1px solid gray;
            text-align: right;
            color: #000;
          "
          colspan="2"
        >
          Change Amount:
        </td>
        <td
          style="padding: 3px; box-sizing: border-box; text-align: right"
          colspan="2"
        >
          <strong> 0.00</strong>
        </td>
      </tr>
    </table>
    <footer style="width: 800px; margin-inline: auto">
      <h4 style="line-height: 2px">
        Get Free Home Delivery
        <span style="font-size: 12px">(masalaBazaar.com.bd)</span>
      </h4>

      <h3 style="line-height: 2px">
        <span>Tel:</span> 89088899, <span>Mobile:</span> 01777777777
      </h3>

      <p style="margin-bottom: 0px">
        <strong>Note:</strong> Purchases Of Defected Item Must be Exchanged By
        72 Hour With Invoice.
      </p>

      <p style="text-align: left; line-height: 0px; margin-top: 10px">
        <small>(Condition Applicable)</small>
      </p>
    </footer>
  </body>
</html>
            """,
        ));
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
    Navigator.push(context, MaterialPageRoute(builder:
        (context) => PreviewScreen(doc: doc),));
  }

  /// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
  void _convertPdfToImages(pw.Document doc) async {
    await for (var page in Printing.raster(await doc.save(), pages: [0, 1], dpi: 72)) {
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
