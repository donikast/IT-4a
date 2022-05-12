function updateUserInfo() {
debugger
const postedData = 	toJSONString(document.querySelector('form.user-info'));
	
fetch('asyncUpdateData', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: postedData
})
.then((response) => { return response.json() } )
.then((data) => {
  document.getElementById("result").innerHTML=data.message;
});
}

  function toJSONString(form) {
	let obj = {};
	let elements = form.querySelectorAll( "input" );
	for( let i = 0; i < elements.length; i++ ) {
		let element = elements[i];
		let name = element.name;
		let value = element.value;

		if( name ) {
			obj[ name ] = value;
		}
	}

	return JSON.stringify(obj);
}