feature 'View a task' do

  scenario 'I can see existing tasks on my task page' do
    task = create :task
    visit '/tasks'
    expect(page.status_code).to eq 200
    within 'ul#tasks' do
      expect(page).to have_content('Task: Make dinner')
    end
  end
end

feature 'Creating tasks' do 
	scenario 'I can create a new task' do 
		visit '/tasks/new'
		fill_in 'task_name', with: 'Make dinner'
		fill_in 'date', with: '2015-09-27'
		click_button 'Create task'

		expect(current_path).to eq '/tasks'
		within 'ul#tasks' do
			expect(page).to have_content('Task: Make dinner')
		end 
	end 
end 