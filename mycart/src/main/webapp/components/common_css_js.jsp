<!-- Css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<!-- Javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script>
/**
 * 
 */
function add(pid,pname,price){
	
	
	let cart = localStorage.getItem("cart");
	if (cart == null)
	{
		//no cart yet
		let products =[];
		let product ={ productId: pid, productName: pname, productQuantity:1, productPrice:price};
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("Product is added for the first time ")
		showToast("Item is added to Cart")
    }else
    {
	    let pcart = JSON.parse(cart);
		
		let oldProduct = pcart.find((item)=> item.productId == pid)
		//console.log(oldProducts);
		if(oldProduct)
		{
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item)=> {
				if(item.productId == oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity;
					
				}
				
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product Is Added");
			showToast("Quantity increased")
		}else{
			let product ={ productId: pid, productName: pname, productQuantity:1, productPrice:price};
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Product is added ")
			showToast("Product is added to Cart")
		}
}
     updateCart();

}

function updateCart()
{
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0)
	{
		console.log("Cart is Empty!");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h4>Oops! Your cart is empty.</h4>");
		$(".checkout-btn").attr('disabled', true);
	} else{
		
		console.log(cart)
		$(".cart-items").html(`( ${cart.length} )`);
		
		let table=`
		  <table class='table'>
		  <thead class='thread-light'>
          		<tr>
				<th>Item Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Action</th>
				</tr>
				</thead>
				
				`;
							
		let totalPrice = 0;
		cart.map((item)=>{
			
			table += `
			<tr>
			<td> ${item.productName}</td>
			<td> ${item.productPrice}</td>
			<td> ${item.productQuantity}</td>
			<td> ${item.productQuantity * item.productPrice}</td>
			<td> <button onclick='deleteItemFromCart(${item.productId})'class='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
              `
		 
	   totalPrice += item.productPrice * item.productQuantity;

		})
		
		       table = table+ `</table>`
				$(".cart-body").html(table);
		
		table = table + `
		   <tr><td colspan= '5' class= 'text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td></tr>
         </table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled', false);
		
	}
	}

function  deleteItemFromCart(pid)
{
	let cart= JSON.parse(localStorage.getItem('cart'));
	
	let newcart = cart.filter((item)=> item.productId != pid)
	localStorage.setItem('cart', JSON.stringify(newcart))
	updateCart();
	showToast("Product removed from Cart")
}

$(document).ready(function (){
	updateCart()
})

function goToCheckout(){
	window.location="checkout.jsp"
}

function goToIndex(){
		
		showToast("Your order has been placed successfully!")
		localStorage.clear();		
}

function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
		
	}, 2000);
}

</script>