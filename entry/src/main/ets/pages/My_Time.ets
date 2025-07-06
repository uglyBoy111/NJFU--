//学期开始时间
const start_date = new Date('2024/07/01');
//现在的时间
let now_time=new Date
// 计算两个时间戳之间的差值
const timeDiff = Number(now_time) - Number(start_date);
// 转换为天数差
const days: number = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
//现在的小时
const now_hour= now_time.getHours()
//现在的分钟
const now_minutes = now_time.getMinutes()
//现在是学期第几周
let now_week:number=Math.ceil(days/7)
//现在是周几
let now_day=now_time.getDay()
//现在是第几节课
let now_order:number=getCurrentClassTime();
//现在是第几节课函数功能
function getCurrentClassTime(): number {
  // 定义每天的课程时间表
  const classSchedule = [
    { start: 8 * 60, end: 8 * 60 + 45 }, // 第一节课
    { start: 8 * 60 + 55, end: 9 * 60+40 }, // 第二节课
    { start: 10 * 60 + 10, end: 10 * 60+55 }, // 第三节课
    { start: 11 * 60 + 5, end: 11 * 60 + 55 }, // 第四节课
    { start: 14 * 60, end: 14 * 60+45 }, // 第五节课
    { start: 14 * 60 + 50, end: 15 * 60+35 }, // 第六节课
    { start: 15* 60 + 55, end: 16 * 60+40 }, // 第七节课
    { start: 16 * 60 + 45, end: 17 * 60+30 }, // 第八节课
    { start: 18 * 60 + 30, end: 19 * 15 }, // 第九节课
    { start: 19 * 60 + 20, end: 20 * 60 + 5 }, // 第十节课
    { start: 20 * 60 + 15, end: 21 * 60 }  // 第十一节课
  ];

  // 将当前时间转换为分钟
  const currentMinutes = now_hour * 60 + now_minutes;

  // 遍历课程时间表
  for (let i = 0; i < classSchedule.length; i++) {
    const { start, end } = classSchedule[i];
    if (currentMinutes >= start && currentMinutes < end) {
      console.log(`现在是第${now_week}周，周${now_day}，第 ${i + 1} 节课的时间。`);
      return i+1;
    }
  }

  // 如果当前时间不在任何课程时间段内
  console.log(`现在是第${now_week}周，周${now_day}，当前时间不是上课时间。`);
}

export {now_week,now_day,now_order,start_date}