require 'yaml'
require 'date'

class Intake

  FILE_NAME = File.join('data', 'intakes.yml')

  DAYS_IN_WEEK = 7
  PRECOURSE_LENGTH = 4 * DAYS_IN_WEEK

  # We hide courses two days before the precourse starts
  PRECOURSE_BUFFER = 2

  attr_reader :dates

  def initialize(dates)
    @dates = dates
  end

  def start_date
    Date.parse(dates['start_date'])
  end

  def end_date
    Date.parse(dates['end_date'])
  end

  def locations
    dates['locations']
  end

  def precourse_start_date
    return Date.parse(dates['precourse_start_date']) if dates['precourse_start_date']
    start_date - PRECOURSE_LENGTH
  end

  def in_future?
    start_date >= Date.today
  end

  def precourse_started?
    Date.today > (precourse_start_date - PRECOURSE_BUFFER)
  end

  def ==(intake)
    intake.dates == dates
  end

  def self.advertised_dates
    future_dates.reject(&:precourse_started?)
  end

  private

  def self.future_dates
    all.select(&:in_future?)
  end

  def self.all
    YAML.load_file(FILE_NAME).map do |dates|
      new(dates)
    end
  end
end
