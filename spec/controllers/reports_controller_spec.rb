RSpec.describe ReportsController do
  describe '#show' do
    subject { api_get :show, params: params }

    let(:report) { create(:report, :with_photos) }
    let(:params) { { id: report.id } }

    it 'returns report' do
      expect(subject).to be_success

      expect(response_json).to include(
        'description' => instance_of(String),
        'report_photos' => array_including(
          hash_including('photo_url' => anything)
        ),
      )
    end
  end

  describe '#index' do
    subject { api_get :index, params: params }

    let(:params) { {} }

    before do
      create(:report)
      create(:report)
    end

    it 'returns reports' do
      expect(subject).to have_http_status(:ok)
      expect(response_json).to include('entries')
    end
  end

  describe '#create' do
    subject { api_post :create, params: params }

    let(:params) { { report: report_params } }
    let(:report) { create(:report) }

    let(:report_params) do
      {
        report_type_id: '1',
        status_id: '1',
        description: 'Description',
        address: 'Address',
        license_plate_no: 'ABC123',
        lat: '10',
        lng: '10',
        registered_at: '2017-12-01 12:00:00',
      }
    end

    before do
      allow(::Reports::Create)
        .to receive(:run).with(user, hash_including(report_params)).and_return(report)
    end

    it 'returns reports' do
      expect(subject).to be_success
      expect(response_json).to include(
        'description' => instance_of(String),
      )
    end

    context 'when report has validation errors' do
      let(:report) { Report.new.tap(&:save) }

      it 'returns errors' do
        expect(subject).to have_http_status(:bad_request)
        expect(response_json).to include('errors')
      end
    end
  end
end