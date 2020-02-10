require 'rails_helper'

resource 'Projects' do
  explanation 'Projects resource'

  header 'Content-Type', 'application/json'
  let(:raw_post) { params.to_json }

  let(:project) { create :project }
  let(:id) { project.id }

  get '/api/v1/projects' do
    with_options scope: :projects do
      response_field :name, "Name of order", :type => :string
      response_field :paid, "If the order has been paid for", :type => :boolean
      response_field :email, "Email of user that placed the order", :type => :string
    end

    context '200' do
      example_request 'Getting a list of projects' do
        expect(status).to eq 200
      end
    end
  end

  post '/api/v1/projects' do
    with_options scope: :project, with_example: true do
      parameter :title, 'The project title', required: true
    end

    context '201' do
      let(:request) { { project: { title: 'Test title' } } }
      let(:expected_response) do
        {
          id: 1,
          title: 'Test title'
        }
      end

      example 'Create a project with good data' do
        do_request(request)

        expect(status).to eq 201
        expect(json_response_body).to eq(expected_response)
      end
    end

    context '400' do
      let(:request) { { project: { title: nil } } }

      example 'Create a project with bad data' do
        do_request(request)

        expect(status).to eq 400
      end
    end
  end

  get '/api/v1/projects/:id' do
    context '200' do
      example_request 'Get an project' do
        expect(status).to eq(200)
      end
    end

    context '404' do
      let(:id) { 'xoxo' }

      example_request 'Project is not found' do
        expect(status).to eq(404)
      end
    end
  end

  patch '/api/v1/projects/:id' do
    with_options scope: :project, with_example: true do
      parameter :title, 'The project title', required: true
    end

    context '200' do
      let(:request) { { project: { title: 'Test title 2' } } }

      example 'Update project with correct data' do
        do_request(request)

        expect(status).to eq 200
      end
    end

    context '400' do
      let(:request) { { project: { title: nil } } }

      example 'Update project with bad data' do
        do_request(request)

        expect(status).to eq 400
      end
    end
  end

  delete '/api/v1/projects/:id' do
    context '200' do
      example 'Destroy project' do
        do_request

        expect(status).to eq 200
      end
    end
  end
end
