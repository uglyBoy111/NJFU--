interface UserInfo{
  username:string
  password:string
}

let users:UserInfo[]=[
  {username:'2250301410',password:'123456'},
  {username:'2250301416',password:'123456'},
  {username:'admin',password:'123456'}
]

import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '111';
  @State MyTips:string='不会写这个功能'//提示我不会写的状态变量
  //账号密码
  @State username:string=''
  @State password:string=''
  //构建界面
  build() {
    Column({ space: 10 }) {

      //统一身份认证
      Row() {
        Image($r('app.media.ic_public_cancel'))
          .width(23)
          .fillColor('#111')
        Text('统一身份认证')
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
        Image($r('app.media.ic_public_more_list'))
          .width(21)
          .fillColor('#111')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(40)
      .backgroundColor(Color.White)

      //校徽
      Image($r("app.media.ic_public_xiaohui"))
        .height(150)
        .margin({
          bottom: 8,
          top:5
        })

      Swiper(){
        Text('欢迎登录')
          .margin({
            bottom: 25
          })
          .fontColor('#666')
        Text('梁川川')
          .margin({
            bottom: 25,
            left:9
          })
          .fontColor('#666')
        Text('时海鹏')
          .margin({
            bottom: 25,
            left:9
          })
          .fontColor('#666')
        Text('刘笑天')
          .margin({
            bottom: 25,
            left:9
          })
          .fontColor('#666')
        Text('马俊杰')
          .margin({
            bottom: 25,
            left:9
          })
          .fontColor('#666')
      }
      .loop(true)
      .autoPlay(true)
      .interval(1300)
      .indicator(false)

      //账号密码输入
      TextInput({
        placeholder: '请输入用户名'
      })
        .type(InputType.Normal)
        .onChange((value:string)=>{
          this.username=value
        })
      TextInput({
        placeholder: '请输入密码'
      })
        .type(InputType.Password)
        .onChange((value:string)=>{
          this.password=value
        })

      //登录按钮
      Button('登录').onClick(() => {

        let i=0

        //for循环遍历用户名查找是否有匹配值
        for(i;i<users.length;i++){
          //console.log(this.username,this.password)
          if((users[i].username==this.username)
          &&(users[i].password==this.password)){
            router.pushUrl({
              url:'pages/doahangye'
            })
          }
          if((i==users.length-1)
          &&((users[i].username!=this.username)
          ||(users[i].password!=this.password))){
            AlertDialog.show({message:'用户名或密码错误'})
          }
        }
      })
        .width('100%')
        .colorBlend(Color.Green)

      //注册、忘记密码
      Row({ space: 10 }) {
        Text('前往注册')
          .margin({
            right: 5
          })
          .fontColor('#00bfff')
          .onClick(()=>{
            AlertDialog.show({message:'还没有写'})
          })
        Text('忘记密码')
          .fontColor('#00bfff')
          .onClick(()=>{
            AlertDialog.show({message:'还没有写'})
          })
      }
      .justifyContent(FlexAlign.Center)

      //其它方式登录
      Blank()
      Text('-----------您还可以使用以下登录方式------------')
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor('#666')
        .margin({
          bottom:25
        })
      Row(){

        //QQ登录
        Column(){
          Image($r('app.media.ic_public_QQ'))
            .width(30)
            .onClick(()=>{
              AlertDialog.show({message:'还没有写'})
            })
          Text('QQ登录')
            .fontSize(13)
            .margin({
              left:2
            })
        }
        .layoutWeight(1)

        //访客登录
        Column(){
          Image($r('app.media.ic_public_dongtaima'))
            .width(33)
            .onClick(()=>{
              AlertDialog.show({message:'还没有写'})
            })
          Text('访客登录')
            .fontSize(13)
            .margin({
              left:1,
              top:1
            })
        }
        .layoutWeight(1)
      }
      .margin({
        bottom:15
      })
      .width('50%')
    }
    //最大的列的属性
    .padding(15)
    .width('100%')
    .height('100%')
  }
}
