import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculation"
export default class extends Controller {
  static targets = ["end", "start", "price", "cost"]
  connect() {
    // console.log(this.endTarget)
    // console.log(this.startTarget)
    // console.log(this.priceTarget)
    // console.log(this.costTarget.innerText)
  }

  calc(event) {
    // console.log(this.endTarget.value)
    // console.log(this.startTarget.value)
    const startDate = this.startTarget.value
    const endDate = this.endTarget.value
    const cost = Number(this.costTarget.innerText)
    var date1 = new Date(startDate)
    var date2 = new Date(endDate)
    // console.log(date1)
    // console.log(date2)
    const difference = (Math.round((date2 - date1) / (1000 * 60 * 60 * 24)))
    const finalPrice = cost * difference
    console.log(finalPrice)
    console.log(this.priceTarget)
    this.priceTarget.innerHTML = `:   £${finalPrice}`

  }
}


// if start date exists then when get end date calculate the price
// pass start and end date into date time variables then subtract and get integer
// multiply the price by that integer then insert that into the price target
