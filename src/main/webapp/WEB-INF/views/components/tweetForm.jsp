<div class="cardContainer d-none" id="cardContainer">
  <div class="card">
    <div class="card-header clearfix">
      <div class="float-left">Write a Tweet</div>
      <div class="float-right" style="cursor:pointer" id="closeTweetFormBtn">
        <i class="fas fa-times"></i>
      </div>
    </div>
    <div class="card-body">
      <form id="tweetForm">
        <div class="form-group">
          <div class="d-block">
            <textarea
              name="tweetContent"
              id="tweetContent"
              style="width: 100%;"
              rows="3"
            ></textarea>
          </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit</button>
      </form>
    </div>
  </div>
</div>

<style scoped>
  .cardContainer {
    width: 30%;
    margin: 5rem auto 0;
  }

  @media (max-width: 575.98px) {
    .cardContainer {
      max-width: 300px;
    }
  }
</style>
