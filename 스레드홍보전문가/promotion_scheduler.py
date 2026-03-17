import os
import random
import time

# [ThreadPromoter | 스레드홍보전문가] - Scheduler Logic Mockup

AGENTS = [
    "SeniorDeveloper | 선임개발자",
    "EcomOpsKR | 한국이커머스운영",
    "G2GTechKR | 한국공공디지털제안",
    "MedicalComplianceKR | 의료마케팅준법전문가",
    "UIArchitect | UX아키텍트",
    "GrowthHacker | 그로스해커"
]

REPO_URL = "https://github.com/jyoung9154/AgentSkills"

def generate_witty_content(agent):
    """
    이 함수는 실제 환경에서 ThreadPromoter 에이전트에게 
    특정 에이전트를 주제로 포스팅을 생성하도록 요청하는 역할을 시뮬레이션합니다.
    """
    prompts = [
        f"개발자 고충: 밤샘 코딩 중 발견한 오타 하나 때문에 전체 빌드가 깨졌을 때\n솔루션: [{agent}]를 호출해 멘탈과 코드를 동시에 케어받으세요.",
        f"대표님: '이거 왜 디자인이 투박하죠?'\n나: (침묵)\n솔루션: [{agent}]가 당신의 앱에 프리미엄 광택을 입혀줍니다.",
        f"혼자서 마케팅까지 하려니 죽을 맛이죠?\n솔루션: [{agent}]는 당신이 자는 동안에도 스레드에서 드립을 칩니다."
    ]
    return random.choice(prompts)

def start_promotion_cycle():
    print(f"--- [ThreadPromoter | 스레드홍보전문가] 자동 홍보 엔진 가동 ---")
    while True:
        selected_agent = random.choice(AGENTS)
        content = generate_witty_content(selected_agent)
        
        print(f"\n[신규 포스트 생성 완료 - {time.strftime('%Y-%m-%d %H:%M:%S')}]")
        print("-" * 30)
        print(content)
        print(f"링크: {REPO_URL}")
        print("-" * 30)
        
        print("\n3시간 대기 중... (Ctrl+C로 중단)")
        # 실제 운영시에는 3 * 3600 (3시간)
        time.sleep(10) # 테스트용 10초
        break # 데모용 1회 실행 후 중단

if __name__ == "__main__":
    start_promotion_cycle()
