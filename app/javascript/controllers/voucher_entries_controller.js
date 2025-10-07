import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voucher-entries"
export default class extends Controller {
  static targets = ["entries", "template"]

  add(event) {
    event.preventDefault()
    let content = this.templateTarget.innerHTML
    // Replace NEW_RECORD with a unique timestamp so Rails can map attributes
    content = content.replace(/NEW_RECORD/g, new Date().getTime())
    this.entriesTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    event.preventDefault()
    const fieldWrapper = event.target.closest(".nested-fields")
    if (!fieldWrapper) return

    // If it's a new record, just remove the DOM node
    if (fieldWrapper.dataset.newRecord === "true") {
      fieldWrapper.remove()
      return
    }

    // For existing records, mark _destroy hidden field if present
    const destroyField = fieldWrapper.querySelector("input[name*='[_destroy]']")
    if (destroyField) {
      destroyField.value = "1"
    } else {
      // fallback in case the hidden field was not rendered
      const hidden = document.createElement("input")
      hidden.type = "hidden"
      hidden.name = this._buildDestroyFieldName(fieldWrapper)
      hidden.value = "1"
      fieldWrapper.appendChild(hidden)
    }

    fieldWrapper.style.display = "none"
  }

  _buildDestroyFieldName(wrapper) {
    // Find any field name like voucher[voucher_entries_attributes][123456][amount]
    // and replace the last attribute with _destroy
    const firstInput = wrapper.querySelector("input, select, textarea")
    if (!firstInput) return "voucher[voucher_entries_attributes][NEW_RECORD][_destroy]"
    return firstInput.name.replace(/\[[^\]]+\]$/, "[_destroy]")
  }
}

