/**
 * 
 */

var test = document.getElementById("affForm").value;
console.log(test);

if (test == 1) {
	document.getElementById("myForm").style.display = "block";
	test=0;
}

document.getElementById("myBtn").addEventListener("click", function() {
	document.getElementById("myForm").style.display = "block";
});

document.getelementbyid("btnterminer").addeventlistener("click", function() {
	document.getelementbyid("myform").style.display = "none";
});