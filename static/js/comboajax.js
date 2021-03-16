function itemdisplay(cat) 
{
    if (cat == "") {
        document.getElementById("info").innerHTML = "";
        return;
    } 
    else 
    {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } 
	else 
	{
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        
	
        xmlhttp.open("GET",'showcat.php?&Category='+cat,true);

	xmlhttp.onreadystatechange = function() 
	{
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
	    {

		var content=xmlhttp.responseText;
		if(content)
		{
		document.getElementById("info").innerHTML = content;
		}
            }
        }

        xmlhttp.send();
    }
}