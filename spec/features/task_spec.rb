feature 'View a task' do

  scenario 'I can see existing tasks on my task page' do
    task = build :task
    visit '/tasks'
    expect(page.status_code).to eq 200
    within 'ul#tasks' do
      expect(page).to have_content('Make dinner')
    end
  end
end