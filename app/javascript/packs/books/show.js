$(function () {
  $('#openModal').on('click', function() {
    $('#reviewModal').addClass('show').css('display', 'block');
  });
  $('.close-modal').on('click', function() {
    $('#reviewModal').removeClass('show').css('display', 'none');
    $("[id^='editReviewModal']").removeClass('show').css('display', 'none');
  });
  $("[id^='editOpenModal']").on('click', function() {
    let id = $(this).attr('id');
    let reviewId = id.split('-')[1];
    $(`#editReviewModal-${reviewId}`).addClass('show').css('display', 'block');
  });
});