import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

void main() => runApp( const MyApp());

class   MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Bitcoin Converter',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
       // can change
      ),
      home:  const BitcoinExchangeValue(),
      
    );
  }
}

class BitcoinExchangeValue extends StatefulWidget {
  const  BitcoinExchangeValue ({Key? key}) : super(key: key);

  @override
  State< BitcoinExchangeValue> createState() => _BitcoinExchangeValueState();
}

class _BitcoinExchangeValueState extends State< BitcoinExchangeValue> {
 String selectDefault = "USD",
 name="",unit="",
 type="",descAA="";
 var desc = "No  information" ; //appear          //dropbutton1

 // display
    

  var value;
 

List<String> exchangeList = [                 
    "BTC" ,"ETH","LTC","BCH","BNB" ,"EOS","XRP","XLM","LINK" ,"DOT","YFI","USD","AED" ,"ARS","AUD","BDT",
    "BHD" ,"BMD","BRL","CAD","CHF" ,"CLP","CNY","CZK","DKK" ,"EUR","GBP","HKD","HUF","IDR","ILS","INR",
    "JPY","KRW", "KWD" ,"IKR","MMK","MXN","MYR","NGN","NOK","NZD","PHP","PKR", "PLN" ,"RUB","SAR","SEK",
    "SGD","THB","TRY","TWD","UAH","VEF","VND", "ZAR","XDR","XAG","XAU","BITS","SATS",];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Bitcoin Converter App")),
        body: Container(  color: Color.fromARGB(255, 242, 218, 186),
         
            child: Column(
               

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
           
           


              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  // ignore: prefer_const_constructors
                  Container(
                    padding: const EdgeInsets.all(18.0),
                    color: Colors.white,
                    child: const Text(  "Bitcoin ", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
                
           // ignore: prefer_const_constructors
          Container(
            
                    padding: const EdgeInsets.all(20.0),
             child: const Icon(Icons.arrow_right_alt_outlined,size: 40.0,),
           ),
            

            Container(
              padding:const EdgeInsets.all(10.0) ,
              color: Colors.white,
              child: DropdownButton(             //dropdown button 2
                itemHeight: 50,
                
                
                value: selectDefault, 
                onChanged: (newValue) {
                  setState(() {
                   selectDefault = newValue.toString();
                  });
                },
                items: exchangeList.map((selectDefault) {
                  return DropdownMenuItem(
                    child: Text(
                      selectDefault, style:TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold) ,
                    ),
                    value: selectDefault,
                  );
                }).toList(),          //follow list select
              ),
            ),
            ],
              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.00, 10.0, 0.0,0.0),
              child: ElevatedButton(onPressed: _convert, child: const Text("Convert")),
            ),
                   //button
                   
Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
  child:   Text(desc, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
),

Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
  child:   Text(descAA,style: const TextStyle(fontSize:15)),
),
          ]
           
            )
        )
    );
  }

  Future <void >_convert() async {

  ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Searching..."));
    progressDialog.show();
  
var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
var response = await http.get(url); //get url content

var jsonData = response.body; //content
var parsedJson = json.decode(jsonData);


if(selectDefault == exchangeList[0]) {
   name = parsedJson['rates']['btc']['name'];
  value = parsedJson['rates']['btc']['value'];

}
else if(selectDefault == exchangeList[1]) {
  name = parsedJson['rates']['eth']['name'];
  value = parsedJson['rates']['eth']['value'];

}

else if(selectDefault == exchangeList[2]) {
    name = parsedJson['rates']['ltc']['name'];
  value = parsedJson['rates']['ltc']['value'];

}
else if(selectDefault == exchangeList[3]) {
  name = parsedJson['rates']['bch']['name'];
  value = parsedJson['rates']['bch']['value'];

}

else if(selectDefault == exchangeList[4]) {
    name = parsedJson['rates']['bnb']['name'];
  value = parsedJson['rates']['bnb']['value'];

}
else if(selectDefault == exchangeList[5]) {
  name = parsedJson['rates']['eos']['name'];
  value = parsedJson['rates']['eos']['value'];

}

else if(selectDefault == exchangeList[6]) {
    name = parsedJson['rates']['xrp']['name'];
  value = parsedJson['rates']['xrp']['value'];

}
else if(selectDefault == exchangeList[7]) {
  name = parsedJson['rates']['xlm']['name'];
  value = parsedJson['rates']['xlm']['value'];

}

else if(selectDefault == exchangeList[8]) {
    name = parsedJson['rates']['link']['name'];
  value = parsedJson['rates']['link']['value'];

}

else if(selectDefault == exchangeList[9]) {
  name = parsedJson['rates']['dot']['name'];
  value = parsedJson['rates']['dot']['value'];

}

else if(selectDefault == exchangeList[10]) {
    name = parsedJson['rates']['yfi']['name'];
  value = parsedJson['rates']['yfi']['value'];

}
else if(selectDefault == exchangeList[11]) {
  name = parsedJson['rates']['usd']['name'];
  value = parsedJson['rates']['usd']['value'];

}

else if(selectDefault == exchangeList[12]) {
    name = parsedJson['rates']['aed']['name'];
  value = parsedJson['rates']['aed']['value'];

}
else if(selectDefault == exchangeList[13]) {
  name = parsedJson['rates']['ars']['name'];
  value = parsedJson['rates']['ars']['value'];

}

else if(selectDefault == exchangeList[14]) {
    name = parsedJson['rates']['aud']['name'];
  value = parsedJson['rates']['aud']['value'];

}
else if(selectDefault == exchangeList[15]) {
  name = parsedJson['rates']['bdt']['name'];
  value = parsedJson['rates']['bdt']['value'];

}

else if(selectDefault == exchangeList[16]) {
    name = parsedJson['rates']['bhd']['name'];
  value = parsedJson['rates']['bhd']['value'];

}
else if(selectDefault == exchangeList[17]) {
  name = parsedJson['rates']['bmd']['name'];
  value = parsedJson['rates']['bmd']['value'];

}

else if(selectDefault == exchangeList[18]) {
    name = parsedJson['rates']['brl']['name'];
  value = parsedJson['rates']['brl']['value'];

}
else if(selectDefault == exchangeList[19]) {
  name = parsedJson['rates']['cad']['name'];
  value = parsedJson['rates']['cad']['value'];

}

else if(selectDefault == exchangeList[20]) {
    name = parsedJson['rates']['chf']['name'];
  value = parsedJson['rates']['chf']['value'];

}
else if(selectDefault == exchangeList[21]) {
  name = parsedJson['rates']['clp']['name'];
  value = parsedJson['rates']['clp']['value'];

}

else if(selectDefault == exchangeList[22]) {
    name = parsedJson['rates']['cny']['name'];
  value = parsedJson['rates']['cny']['value'];

}
else if(selectDefault == exchangeList[23]) {
  name = parsedJson['rates']['czk']['name'];
  value = parsedJson['rates']['czk']['value'];

}

else if(selectDefault == exchangeList[24]) {
    name = parsedJson['rates']['dkk']['name'];
  value = parsedJson['rates']['dkk']['value'];

}
else if(selectDefault == exchangeList[25]) {
  name = parsedJson['rates']['eur']['name'];
  value = parsedJson['rates']['eur']['value'];

}

else if(selectDefault == exchangeList[26]) {
    name = parsedJson['rates']['gbp']['name'];
  value = parsedJson['rates']['gbp']['value'];

}
else if(selectDefault == exchangeList[27]) {
  name = parsedJson['rates']['hkd']['name'];
  value = parsedJson['rates']['hkd']['value'];

}

else if(selectDefault == exchangeList[28]) {
    name = parsedJson['rates']['huf']['name'];
  value = parsedJson['rates']['huf']['value'];

}
else if(selectDefault == exchangeList[29]) {
  name = parsedJson['rates']['idr']['name'];
  value = parsedJson['rates']['idr']['value'];

}

else if(selectDefault == exchangeList[30]) {
    name = parsedJson['rates']['ils']['name'];
  value = parsedJson['rates']['ils']['value'];

}
else if(selectDefault == exchangeList[31]) {
  name = parsedJson['rates']['inr']['name'];
  value = parsedJson['rates']['inr']['value'];

}

else if(selectDefault == exchangeList[32]) {
    name = parsedJson['rates']['jpy']['name'];
  value = parsedJson['rates']['jpy']['value'];

}

else if(selectDefault == exchangeList[33]) {
  name = parsedJson['rates']['kwd']['name'];
  value = parsedJson['rates']['kwd']['value'];

}

else if(selectDefault == exchangeList[34]) {
  name = parsedJson['rates']['krw']['name'];
  value = parsedJson['rates']['krw']['value'];

}

else if(selectDefault == exchangeList[35]) {
    name = parsedJson['rates']['lkr']['name'];
  value = parsedJson['rates']['lkr']['value'];

}
else if(selectDefault == exchangeList[36]) {
  name = parsedJson['rates']['mmk']['name'];
  value = parsedJson['rates']['mmk']['value'];

}

else if(selectDefault == exchangeList[37]) {
    name = parsedJson['rates']['mxn']['name'];
  value = parsedJson['rates']['mxn']['value'];

}

else if(selectDefault == exchangeList[38]) {
  name = parsedJson['rates']['myr']['name'];
  value = parsedJson['rates']['myr']['value'];

}

else if(selectDefault == exchangeList[39]) {
    name = parsedJson['rates']['ngn']['name'];
  value = parsedJson['rates']['ngn']['value'];

}
else if(selectDefault == exchangeList[40]) {
  name = parsedJson['rates']['nok']['name'];
  value = parsedJson['rates']['nok']['value'];

}

else if(selectDefault == exchangeList[41]) {
    name = parsedJson['rates']['nzd']['name'];
  value = parsedJson['rates']['nzd']['value'];

}

else if(selectDefault == exchangeList[42]) {
  name = parsedJson['rates']['php']['name'];
  value = parsedJson['rates']['php']['value'];

}

else if(selectDefault == exchangeList[43]) {
    name = parsedJson['rates']['pkr']['name'];
  value = parsedJson['rates']['pkr']['value'];

}
else if(selectDefault == exchangeList[44]) {
  name = parsedJson['rates']['pln']['name'];
  value = parsedJson['rates']['pln']['value'];

}

else if(selectDefault == exchangeList[45]) {
    name = parsedJson['rates']['rub']['name'];
  value = parsedJson['rates']['rub']['value'];

}

  else if(selectDefault == exchangeList[46]) {
  name = parsedJson['rates']['sar']['name'];
  value = parsedJson['rates']['sar']['value'];

}

else if(selectDefault == exchangeList[47]) {
    name = parsedJson['rates']['sek']['name'];
  value = parsedJson['rates']['sek']['value'];

}
else if(selectDefault == exchangeList[48]) {
  name = parsedJson['rates']['sgd']['name'];
  value = parsedJson['rates']['sgd']['value'];

}

else if(selectDefault == exchangeList[49]) {
    name = parsedJson['rates']['thb']['name'];
  value = parsedJson['rates']['thb']['value'];

}
else if(selectDefault == exchangeList[50]) {
  name = parsedJson['rates']['try']['name'];
  value = parsedJson['rates']['try']['value'];

}

else if(selectDefault == exchangeList[51]) {
    name = parsedJson['rates']['twd']['name'];
  value = parsedJson['rates']['twd']['value'];

}
else if(selectDefault == exchangeList[52]) {
  name = parsedJson['rates']['uah']['name'];
  value = parsedJson['rates']['uah']['value'];

}

else if(selectDefault == exchangeList[53]) {
    name = parsedJson['rates']['vef']['name'];
  value = parsedJson['rates']['vef']['value'];

}

else if(selectDefault == exchangeList[54]) {
  name = parsedJson['rates']['vnd']['name'];
  value = parsedJson['rates']['vnd']['value'];

}

else if(selectDefault == exchangeList[55]) {
    name = parsedJson['rates']['zar']['name'];
  value = parsedJson['rates']['zar']['value'];

}
else if(selectDefault == exchangeList[56]) {
  name = parsedJson['rates']['xdr']['name'];
  value = parsedJson['rates']['xdr']['value'];

}

else if(selectDefault == exchangeList[57]) {
    name = parsedJson['rates']['xag']['name'];
  value = parsedJson['rates']['xag']['value'];

}
else if(selectDefault == exchangeList[58]) {
  name = parsedJson['rates']['xau']['name'];
  value = parsedJson['rates']['xau']['value'];

}

else if(selectDefault == exchangeList[59]) {
    name = parsedJson['rates']['bits']['name'];
  value = parsedJson['rates']['bits']['value'];

}
else if(selectDefault == exchangeList[60]) {
  name = parsedJson['rates']['sats']['name'];
  value = parsedJson['rates']['sats']['value'];

}



          
 setState(() {
desc="1 Bitcoin= $value $selectDefault";
descAA= "You are currenly using the calculator for $name";

});
 progressDialog.dismiss();
} 

}


