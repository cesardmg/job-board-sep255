import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showModal(event) {
    event.preventDefault();
    document.getElementById("confirmationModal").classList.remove("hidden");
  }

  hideModal() {
    document.getElementById("confirmationModal").classList.add("hidden");
  }

  showAccountDeletionModal(event) {
    event.preventDefault();
    document.getElementById("accountDeletionModal").classList.remove("hidden");
  }

  hideAccountDeletionModal() {
    document.getElementById("accountDeletionModal").classList.add("hidden");
  }
}
