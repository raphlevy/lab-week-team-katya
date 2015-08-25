feature 'View a task' do


#need to make factory girl for tag
#need to update the code with the factory girl tag
#need to replace below tag using factory girl
#create to create a helper method using tag and task
#need to test expectations on the page

  scenario 'I can see existing tasks on my task page' do
    user = create :user
    sign_in(user)
    click_link 'Add a task'
    expect(current_path).to eq('tasks/new')
    task = build :task
    tag = Tag.first_or_create(name: 'sport')
    visit '/tasks'
    expect(page.status_code).to eq 200
    within 'ul#tasks' do
      expect(page).to have_content('Make dinner')
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
			expect(page).to have_content('Make dinner')
		end
	end
end