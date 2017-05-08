# LeaseACar

## Nomenclature

* Term:  Length of lease.
* Price:  The final negotiated price of the vehicle   
* Residual:  What the car will be worth at the end of the lease.  Can be thought of as the price the dealership agrees to purchase the car for at the end of the lease.
* Money Factor:  The finance charge rate.  Expressed as a very small number (<10^-2).  Convert to APR to judge whether it's reasonable.
* APR: Annual percentage rate.  Finance charge as yearly rate. 
	* APR = MR * 2400
* Depreciation cost: The value the car loses over the term of the lease
	* Price - Residual
* Finance Charge: The amount you owe over the lease term that is not a part of the lost value (depreciation) of the car.  This is a strange formula, and clearly it's not to your benefit.  But often times leasing is a good deal because it's just not that much.
	* F = (Residual + Price) * MF * Term
* Total payment:  The amount you'll pay the dealership (Car finance company) over the term of the lease.  
	* T = Finance Charge + Depreciation cost.
* __Monthly payment__: T/Term

## Also

You will need to pay for tax, title, license at signing apart from any negotiations.

## Files

* Spreadsheet calculates payments from Price, Residual, MF and Term
* Matlab script makes contour plots.
* Contour plots show relevant quantities in general with varying initial conditions.