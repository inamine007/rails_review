$(function () {
  const g_maxNum = 12;
  const g_booksApiUrl = 'https://www.googleapis.com/books/v1/volumes';
  const g_initSearchString = 'Rails';
  let g_searchString = g_initSearchString;
  let g_pageCount = 1;

  $('#search').on('click', function() {
    $('#card-wrapper').empty();
    $('#search-more').addClass('none');
    g_searchString = $('#search-input').val();
    g_pageCount = 0;
    getBooksApi(g_searchString);
  });

  $('#search-more-btn').on('click', function() {
    const startIndex = g_pageCount * g_maxNum;
    getBooksApi(g_searchString, startIndex);
  });

  /**----------↓FUNC↓----------*/
  /**
   * Google Books APIから返ってきた値をもとにcardを生成する
   * @type {object} data - Google Books APIからの返り値
   * @type {object} reviews - レビュー全データ
   * @return carddom
   */
  function domGenerate(data, reviews) {
    let dom = '';
    let homeUrl = location.origin;
    for(let i =0; i < data.items.length; i++) {
      let image = data.items[i].volumeInfo.imageLinks ? data.items[i].volumeInfo.imageLinks.smallThumbnail : '';
      let title = data.items[i].volumeInfo.title ? data.items[i].volumeInfo.title : '';
      let author = data.items[i].volumeInfo.authors ? data.items[i].volumeInfo.authors[0] : '';
      let reviewsArr = checkExistReview(reviews, data.items[i]);
      let score = reviewsArr.length ? getAvgScore(reviewsArr) : 0;
      dom += `
      <div class="card col-3">
        <a href="${homeUrl}/books/${data.items[i].id}">
          <figure><img src="${image}" alt="..."></figure>
          <div class="card-body">
            <h3 class="card-title">${title}</h3>
            <p class="card-text">${author}</p>
            <p class="star-area">
              <span class="star5_rating" data-rate="${Math.round(score)}"></span><span class="review-count">${reviewsArr.length}</span>
            </p>
          </div>
        </a>
      </div>
      `;
    }

    // books_helper.rbと内容は同じ関数
    function checkExistReview(reviews, book) {
      let reviewsArr = [];
      for(let i=0; i < reviews.length; i++) {
        if(reviews[i].book_id === book.id) reviewsArr.push(reviews[i]);
      }
      return reviewsArr
    }
    function getAvgScore(reviews) {
      let num = 0;
      for(let i=0; i < reviews.length; i++) {
        num += Number(reviews[i].score);
      }
      return score = num / reviews.length;
    }
    return dom;
  }
  /**
   * Google Books APIにアクセス
   * @type {string} searchString - 検索語句
   * @type {number} startIndex - 開始インデックス
   */
  function getBooksApi(searchString, startIndex=0) {
    $.ajax({
      url: `${g_booksApiUrl}?q=${searchString}&maxResults=${g_maxNum}&startIndex=${startIndex}`,
      dataType: "json"
    }).done(function(data){
      let reviews = $('input[name="reviews"]').val();
      let dom = domGenerate(data, JSON.parse(reviews));
      $('#card-wrapper').append(dom);
      if(data.items.length === g_maxNum) {
        g_pageCount++
        $('#search-more').removeClass('none');
      } else {
        $('#search-more').addClass('none');
      }
    }).fail(function(err) {
      alert('api error.');
      console.log(err);
    });
  }
});