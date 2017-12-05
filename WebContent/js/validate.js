function myFunction() {
	var x, text;
	x = document.getElementById("num").value;
	if (isNaN(x) || x < 1 || x > 10) {
		text = "not";
	} else {
		text = "ok";
	}
	document.getElementById("text").innerHTML = text;
}

function file_change(f) {
	var reader = new FileReader();
	reader.onload = function(e) {
		var img = document.getElementById("imgs");
		img.src = e.target.result;
		img.style.display = "inline";
	};
	reader.readAsDataURL(f.files[0]);
}

function checkPhoneAndImages() {
	var x = document.forms["myForm"]["age1"].value;
	var y = document.forms["myForm"]["age2"].value;
	var z = document.forms["myForm"]["age3"].value;
	if (document.getElementById("file_up").value == "") {
		alert("Please select image");
		return false;
	}
	var number = x + y + z;
	for (i = 0; i < number.length; i++) {
		if (number.charAt(i) < "0" || number.charAt(i) > "9") {
			alert("Phone input numbers");
			return false;
		}
	}
	if (number.length < 10) {
		alert("Please enter number 10 digit");
		return false;
	}
}