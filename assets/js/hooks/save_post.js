export default {
  mounted() {
    this.handleKeydown = (event) => {
      if ((event.ctrlKey || event.metaKey) && event.key === "s") {
        event.preventDefault();

        const form = this.el.querySelector("form");
        const formData = new FormData(form);

        // Convert FormData to a nested structure
        const postData = {};
        for (let [key, value] of formData.entries()) {
          if (key.startsWith("post[")) {
            const nestedKey = key.replace("post[", "").replace("]", "");
            postData[nestedKey] = value;
          }
        }

        // Push the "save_post" event with the nested structure
        this.pushEvent("save_post", { post: postData });
      }
    };

    document.addEventListener("keydown", this.handleKeydown);
  },

  destroyed() {
    document.removeEventListener("keydown", this.handleKeydown);
  },
};
