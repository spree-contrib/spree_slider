require 'spec_helper'

RSpec.describe Spree::Slide do
  describe '#in_time?' do
    context 'when both starts_at and ends_at are nil' do
      subject { Spree::Slide.new starts_at: nil, ends_at: nil }

      it { is_expected.to be_in_time }
    end

    context 'when starts_at is in the past and ends_at is nil' do
      subject { Spree::Slide.new starts_at: 2.days.ago, ends_at: nil }

      it { is_expected.to be_in_time }
    end

    context 'when starts_at is in the future and ends_at is nil' do
      subject { Spree::Slide.new starts_at: 2.days.from_now, ends_at: nil }

      it { is_expected.not_to be_in_time }
    end

    context 'when starts_at is nil and ends_at is in the future' do
      subject { Spree::Slide.new starts_at: nil, ends_at: 2.days.from_now }

      it { is_expected.to be_in_time }
    end

    context 'when starts_at is nil and ends_at is in the past' do
      subject { Spree::Slide.new starts_at: nil, ends_at: 2.days.ago }

      it { is_expected.not_to be_in_time }
    end

    context 'when both starts_at and end_at is in the past' do
      subject { Spree::Slide.new starts_at: 2.days.ago, ends_at: 1.day.ago }

      it { is_expected.not_to be_in_time }
    end

    context 'when starts_at is in the past and end_at is in the future' do
      subject { Spree::Slide.new starts_at: 2.days.ago, ends_at: 2.days.from_now }

      it { is_expected.to be_in_time }
    end
  end

  describe '.in_time' do
    it 'returns all the slides from the database that are in time' do
      good_slides = [
        Spree::Slide.create(starts_at: nil, ends_at: nil),
        Spree::Slide.create(starts_at: 2.days.ago, ends_at: nil),
        Spree::Slide.create(starts_at: nil, ends_at: 2.days.from_now),
        Spree::Slide.create(starts_at: 2.days.ago, ends_at: 2.days.from_now)
      ].map(&:id)

      bad_slides = [
        Spree::Slide.create(starts_at: 2.days.from_now, ends_at: nil),
        Spree::Slide.create(starts_at: nil, ends_at: 2.days.ago),
        Spree::Slide.create(starts_at: 2.days.ago, ends_at: 1.day.ago)
      ].map(&:id)

      slides = Spree::Slide.in_time.map(&:id)
      expect(slides).to include *good_slides
      expect(slides).not_to include *bad_slides
    end
  end
end
