var holiday = data.data[0].holiday;
var result = "";
for(var i in holiday){
   var h = holiday[i];
   var name = h.name;
   for(var j in h.list){
      var d = h.list[j];
      if(d.status=='1'){
         result  = result  + ("update dim_date set is_weekend=false,is_holiday=true,is_workday=false,holiday='"+name+"' where date='"+d.date+"';\n");
      }else if(d.status=='2'){
          result  = result  + ("update dim_date set is_weekend=false,is_holiday=false,is_workday=true where date='"+d.date+"';\n");
      }
   }
}