import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["condition", "sleepinessValue", "toast", "modal"]

  selectCondition(event) {
    const selectedButton = event.currentTarget

    this.element.querySelectorAll(".condition-button").forEach((button) => {
      const isSelected = button === selectedButton
      button.classList.toggle("is-selected", isSelected)
      button.setAttribute("aria-pressed", isSelected)
    })

    this.conditionTarget.value = selectedButton.dataset.score
  }

  updateSleepiness(event) {
    const labels = {
      1: "なし（スッキリ）",
      2: "軽度（少し感じる）",
      3: "中程度（少しぼんやり）",
      4: "やや強い（仕事に支障あり）",
      5: "強烈（耐えられない）"
    }

    this.sleepinessValueTarget.textContent = labels[event.currentTarget.value]
  }

  save(event) {
    event.preventDefault()
    this.toastTarget.hidden = false

    window.setTimeout(() => {
      this.toastTarget.hidden = true
    }, 3000)
  }

  openModal() {
    this.modalTarget.hidden = false
  }

  closeModal() {
    this.modalTarget.hidden = true
  }

  closeOnBackdrop(event) {
    if (event.target === event.currentTarget) {
      this.closeModal()
    }
  }
}