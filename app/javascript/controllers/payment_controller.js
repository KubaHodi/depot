import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  static target = [ "selection", "additionalFields" ]
  initialize(){
    this.showAdditionalFields()
  }
  showAdditionalFields(){
    let selection = this.selectionTarget.value

    for(let fields of this.additionalFieldsTargets){
      fields.disabled = fields.hidden = (field.dataset.type != selection)
    }
  }
}
