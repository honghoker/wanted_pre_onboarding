# 원티드 프리온보딩 코스 사전과제 연습 - 날씨 정보 APP
#### 원티드 프리온보딩 코스에 참여하지는 않았지만, Storyboard 없이 오로지 Code로만 만들어보고 싶어 경험 삼아 진행하였다.
#### 소요시간 : 13시간
<br>

![사전과제](https://user-images.githubusercontent.com/50417461/180692946-615771c7-fe37-4ac2-8ac7-cb74285c6cf3.png)

## Screen

![원티드 프리온보딩 사전과제 화면](https://user-images.githubusercontent.com/50417461/180693429-9d701950-521f-4dd7-960f-b4e5914a38d1.png)

## 개발내용
- 찾아본 대부분의 예제가 도시 하나당 한번의 API 호출을 했는데, **n개의 도시의 날씨 정보를 얻으려고 n번의 호출**을 해야하는 방식이 마음에 들지않았다.
문서를 찾아보니 basePath를 기존에 사용하던 **weather 대신 group**을 사용하면 도시의 id들을 parameter로 보내 **한번에 호출**할 수 있는걸 알아냈다.
  - ```https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}``` **(기존)**   
  -> ```https://api.openweathermap.org/data/2.5/group?id={city id,city id,city id,city id}&appid={API key}``` **(변경 후)**

<br>

<img src = "https://user-images.githubusercontent.com/50417461/180693645-210dd7b4-ffbf-437d-a184-bbbc1c75944d.png" width="30%" height="30%">

- **group** 호출을 위해 요청할 도시들의 id값과 리스트에 표시해줄 도시들의 한글이름을 저장할 Dictionary를 만들어주고 API 호출에 활용하였다.

<br>

<img src = "https://user-images.githubusercontent.com/50417461/180693674-e8198c0b-8148-48fb-a5d1-50a150316e51.png" width="60%" height="60%">

- API 호출에 성공하여 데이터를 받아왔을 경우 매번 리스트에 표시되는 도시의 순서가 달라 기존에 만들어준 myCitiesMap을 활용하여 **한글 이름순으로 정렬**해주었다.

<br>
