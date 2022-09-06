if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {facility: @facility, review: Review.new})
  json.inserted_item render(partial: "facilities/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {facility: @facility, review: @review})
end
