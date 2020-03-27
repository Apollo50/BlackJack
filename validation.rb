# frozen_string_literal: true

module Validation
  def validate?
    validation!
    true
  rescue StandardError => e
    puts e
  end
end
