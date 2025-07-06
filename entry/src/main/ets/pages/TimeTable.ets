import router from '@ohos.router';
import { Course, courses } from './My_Lessons'
import { week_select_xiaoli } from './xiaoli';
import {Classrooms}from'./My_Lessons'

let rooms:string[]=['1101','1102','1103','1104','1105','1106',
                    '2101','2102','2103','2104','2105','2106',
                    '5101','5102','5103','5104','5105','5106',
                    '5101','5102','5103','5104','5105','5106']

function getfontColor(index,startOrder) {
  let color = '#000000';
  if(index!= (startOrder-1)){
    color += '00' // 完全不显示
  }
  return color;
}
//课程随机颜色函数
function getRandomColor(index,startOrder) {
  const letters = '0123456789ABCDEF';
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 13+2)];
  }

  if(index!= (startOrder-1)){
    color += '000'; // 此处将透明度设置为00无效，于是设置000超出8位使得完全不显示背景色
  }
  else {
    color += 'A4';
  }
  return color;
}

const courseColorMap = new Map();

function getDurationHeight(index, endOrder) {
  const duration = endOrder - index;
  return `${duration * 250}px`; // 根据每节课的高度计算总高度
}
export {navItem02}
@Builder
function  navItem02(now_week:number,Classrooms){
  Column() {
    // 顶部组件
    Row() {
      Select([
        { value: '教学主楼', icon: "/common/public_icon.svg" },
        { value: '教学五楼', icon: "/common/public_icon.svg" },
      ])
        .selected(2)
        .value('教学楼')
        .font({ size: 16, weight: 500 })
        .fontColor('#182431')
        .selectedOptionFont({ size: 16, weight: 400 })
        .optionFont({ size: 16, weight: 400 })
        .onSelect((index: number) => {
          this.teaching_building_index=index
          this.rooms_index=-1
        })
      Column() {
        Text(`第${now_week}周`)
        Text('2023-2024第二学期')
      }
      .margin({
        top: 5
      })
      if(this.teaching_building_index==0){
        Select([
          { value: '1楼1101', icon: "/common/public_icon.svg" },
          { value: '1楼1102', icon: "/common/public_icon.svg" },
          { value: '1楼1103', icon: "/common/public_icon.svg" },
          { value: '1楼1104', icon: "/common/public_icon.svg" },
          { value: '1楼1105', icon: "/common/public_icon.svg" },
          { value: '2楼1106', icon: "/common/public_icon.svg" },
          { value: '2楼2101', icon: "/common/public_icon.svg" },
          { value: '2楼2102', icon: "/common/public_icon.svg" },
          { value: '2楼2103', icon: "/common/public_icon.svg" },
          { value: '2楼2104', icon: "/common/public_icon.svg" },
          { value: '2楼2105', icon: "/common/public_icon.svg" },
          { value: '2楼2106', icon: "/common/public_icon.svg" }
        ])
          .selected(2)
          .value('教室')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .onSelect((index: number) => {
            this.rooms_index=index
          })
      }
      else if(this.teaching_building_index==1){
        Select([
          { value: '1楼5101', icon: "/common/public_icon.svg" },
          { value: '1楼5102', icon: "/common/public_icon.svg" },
          { value: '1楼5103', icon: "/common/public_icon.svg" },
          { value: '1楼5104', icon: "/common/public_icon.svg" },
          { value: '1楼5105', icon: "/common/public_icon.svg" },
          { value: '2楼5106', icon: "/common/public_icon.svg" },
          { value: '2楼5101', icon: "/common/public_icon.svg" },
          { value: '2楼5102', icon: "/common/public_icon.svg" },
          { value: '2楼5103', icon: "/common/public_icon.svg" },
          { value: '2楼5104', icon: "/common/public_icon.svg" },
          { value: '2楼5105', icon: "/common/public_icon.svg" },
          { value: '2楼5106', icon: "/common/public_icon.svg" }
        ])
          .selected(2)
          .value('教室')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .onSelect((index: number) => {
            this.rooms_index=index
          })
      }
      else {
        Select([
          { value: '请先选择教学楼', icon: "/common/public_icon.svg" }
        ])
          .selected(2)
          .value('教室')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
      }
      Column(){
        Image($r('app.media.search'))
          .width(25)
          .margin(12)
          .onClick(() => {
            router.pushUrl({
              url:'pages/Search_Ability'
            })
          })
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)

    // 添加周一到周日
    Row() {
      Column() {}.width('15%')
      ForEach(this.daysOfWeek, (day: string) => {
        Column() {
          Text(day)
            .fontSize(14)
            .textAlign(TextAlign.Center)
        }
        .width('12%')
      })
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#D3D3D3')
    .margin({
      bottom:10
    })
    // Scroll组件
    Scroll() {
      Column() {
        // 显示时间段和课程
        ForEach(this.timeSlots, (timeSlot: string, index: number) => {
          Row() {
            // 时间段
            Column() {
              Text(`${index + 1}`)
                .fontSize(12)
                .textAlign(TextAlign.Center)
              Text(`${timeSlot}`)
                .fontSize(12)
                .textAlign(TextAlign.Center)
            }
            .width('15%')
            .height(85) // 每个时间段的固定高度
            .padding(5)


            // 每一天的课程
            ForEach([1, 2, 3, 4, 5, 6, 7], (day: number) => {
              Column() {
                // 过滤出当天和当前周次的课程，
                ForEach(this.courseList.filter(course =>

                (((course.classroom==rooms[this.teaching_building_index*12+this.rooms_index])
                ||(this.teaching_building_index==-1))
                ||(this.rooms_index==-1&&this.teaching_building_index!=-1&&course.teaching_building==Classrooms[this.teaching_building_index].name))&&

                (course.time.day == day) &&
                (course.time.week.includes(now_week)) &&
                (course.time.Start_order - 1 <= index)&&
                (course.time.End_order-1 >= index)),(course: Course) => {
                  Column() {
                    Text(`${course.name}`)
                      .fontColor(getfontColor(index,course.time.Start_order))
                      .fontSize(10)
                      .textAlign(TextAlign.Center)
                      .fontWeight(FontWeight.Bold)
                    Text(`@${course.classroom}`)
                      .fontSize(8)
                      .textAlign(TextAlign.Center)
                      .fontColor(getfontColor(index,course.time.Start_order))
                  }
                  .onClick(() => {
                    AlertDialog.show({
                      title:course.name,
                      message:'课程名称'+course.name+'\n'+'上课地点:'+course.classroom+'\n'+'课程教师:'+course.teacher,
                      autoCancel: true,
                      alignment: DialogAlignment.Bottom,
                      gridCount: 4,
                      offset: { dx: 0, dy: -20 },
                      primaryButton: {
                        value: '取消',
                        action: () => {
                          console.info('Callback when the first button is clicked')
                        }
                      },
                      secondaryButton: {
                        value: '确认',
                        action: () => {
                          console.info('Callback when the second button is clicked')
                        }
                      },
                      cancel: () => {
                        console.info('Closed callbacks')
                      }
                    }
                    )
                  })
                  .alignItems(HorizontalAlign.Center) // 水平居中对齐
                  .justifyContent(FlexAlign.Center) // 垂直居中对齐
                  .padding(5)
                  .backgroundColor(getRandomColor(index,course.time.Start_order))
                  .borderRadius(5)
                  .margin({
                    left: 0,
                    right: 0
                  })
                  .height(getDurationHeight(index, course.time.End_order)) // 计算课程框的高度
                })
              }
              .width('12%')
              .height('100%')
            })
          }
          // .zIndex(9-index)
          .width('100%')
          .height(85) // 每个时间段的固定高度
          .padding(5)
        })
      }
      .height('132%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
  .height('100%')
  .width('100%')
  .backgroundImage($r('app.media.backgroundIMG1'))
  .backgroundImagePosition(Alignment.Center)
  .backgroundImageSize(ImageSize.Cover)
}
@Entry
@Component
struct TimeTable {
  @State lessons: string[] = ['第一节课', '第二节课', '第三节课', '第四节课', '第五节课', '第六节课', '第七节课', '第八节课', '第九节课', '第十节课', '第十一节课']
  @State timeSlots: string[] = ['08:00-08:50', '09:00-09:50', '10:10-11:00', '11:10-12:00', '14:00-14:50', '15:00-15:50', '16:10-17:00', '17:10-18:00', '18:30-19:20', '19:30-20:20', '20:30-21:20']
  @State courseList: Course[] = courses
  @State daysOfWeek: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
  @State current_week :number=  week_select_xiaoli
  @State teaching_building_index :number=-1
  @State rooms_index :number=-1

  build() {
    Column() {
      navItem02(week_select_xiaoli,Classrooms)
    }
  }
}