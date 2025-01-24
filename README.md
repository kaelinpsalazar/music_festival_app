# Salapalooza

## Description
This application is has a functionality focus for admins viewing the details of schedules submitted, the ateendee who created that schedule, and the shows in which they are interested in. Aditionally it allows the admin to edit the users information as needed.

## Flow
![flow](./public/images/screen.png)


## Installation
1. Clone the Repository: [App](https://github.com/wally-yawn/mod_3_final_be).
2. Install Dependencies:
```bundle install```
3. Set up the database: 
```rails db:create```
```rails db:migrate```
```rails db:seed```
4. Start Your rails server: 
```rails server```


### Endpoints

GET /api/v1/schedules
 - Description: Fetches a list of all schedules.
 - Request: 
  Maps to: api/v1/schedules#index

  #### Response
  ```
  {
        id: schedule.id,
        title: schedule.title,
        date: schedule.date,
        created_at: schedule.created_at,
        updated_at: schedule.updated_at
      }
  ```

GET /api/v1/users/id/schedules/:id
 - Fetches user-specific schedules details.
 - Request: 
 - Maps to: api/v1/schedules#index

  #### Response
 ```{
      schedule: {
        id: schedule.id,
        title: schedule.title,
        date: schedule.date,
        created_at: schedule.created_at,
        updated_at: schedule.updated_at
      },
      shows: schedule.shows.map do |show|
        {
          id: show.id,
          artist: show.artist,
          date: show.date,
          time: show.time,
          image_url: show.image_url,           
          artist_image_url: show.artist_image_url 
        }
      end,
      user: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name
      }
    }
```


DELETE /api/v1/shows/:id
 - Deletes a show by its ID.
 - Maps to: api/v1/shows#destroy 

  #### Response

 ```
 {("Show removed from schedule")}
 ```

 ### Links
- [Github FE Repo](https://github.com/kaelinpsalazar/final-music-fe)
- [Github BE Repo](https://github.com/kaelinpsalazar/music_festival_app)

 ### Team Member
#### Kaelin Salazar
- [LinkedIn Profile](https://www.linkedin.com/in/kaelin-salazar/)
- [GitHub Profile](https://github.com/kaelinpsalazar)
