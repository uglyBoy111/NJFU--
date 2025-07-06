import router from '@ohos.router';
//起始日期
import {now_week}from'./My_Time'

let week_select_xiaoli:number=now_week

@Extend(Button)
function fancyButton(isOn:Boolean){
  .width(60)
  .height(45)
  .backgroundColor(isOn?'#33AFFF':'#909497')
  .borderRadius(15)
  .margin(8)
}
@Builder
function navItem01(){
  Scroll() {
    Column() {
      Row() {
        Text('南京林业大学校历')
          .fontSize(30)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })

      }

      Scroll() {
        Row() {
          Image($r('app.media.njfuxiaoli'))
            .margin({
              top: 15,
              left: 5
            })
        }
      }
      .width('100%')
      .height(300)
      .scrollable(ScrollDirection.Horizontal)

      Column({ space: 5 }) {
        Text('1、全校学生8月31、9月1日注册报到，9月2日正式上课')
        Text('2、每周星期三下午7-8节课学校集中安排活动时段。')
        Text('3、国庆节、中秋节、元旦放假见校办通知。')
        Text('4、寒假：2025年元月13日～2月16日。 ')
        Text('5、上课时间表：')
      }
      .alignItems(HorizontalAlign.Start)
      .margin({
        top: 5
      })

      Swiper() {
        Image($r('app.media.course01'))

        Image($r('app.media.course02'))
      }
      .width('100%')
      .margin(5)
      Row() {

        Text('学期周数显示')
          .textAlign(TextAlign.Center)
          .width('100%')
          .padding(6)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin(5)

      }

      .width('100%')
      // .backgroundColor(Color.Pink)
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], (item: number, index: number) => {
          GridItem() {
            Column() {
              Button(`${item}`)
                .fancyButton(item == now_week)
                .onClick(() => {
                  week_select_xiaoli = index + 1
                  router.pushUrl({
                    url: 'pages/TimeTable'
                  })
                })
            }

          }

        })
      }
      .columnsTemplate('1fr,1fr,1fr,1fr')
      .rowsTemplate('1fr,1fr,1fr,1fr,1fr')
    }
    .backgroundImage($r('app.media.xiaolibackground1'))
    .width('100%')
    .height('100%')
    .backgroundImagePosition(Alignment.Center)
    .backgroundImageSize(ImageSize.Cover)
  }
  .width('100%')
  .height('140%')
  .scrollable(ScrollDirection.Vertical)
}
export {navItem01}
@Entry
@Component

struct Xiaoli {
  @State week:number[]=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
  build() {
    Column(){
      navItem01()
    }
  }

}
export {
 week_select_xiaoli
}