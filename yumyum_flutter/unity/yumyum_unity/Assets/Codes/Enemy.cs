using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using MoreMountains.Feedbacks;

public class Enemy : MonoBehaviour
{
    [SerializeField] private int hp;
    private int maxHp = 20;
    private bool isDead = false;
    private GameManager gameManager;

    public MMF_Player getDamageFeedback;
    public MMF_Player dieFeedback;
    public GameObject goldParticle;
    public Slider healthSlider;
    public SpriteRenderer spriteRenderer;
    public Sprite normalSprite;
    public Sprite damagedSprite;

    public float startOffset;
    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        InitializeHealthSlider();
        spriteRenderer = GetComponent<SpriteRenderer>();
        spriteRenderer.sprite = normalSprite;
        transform.Translate(0, startOffset, 0);
    }

    void Update()
    {
        UpdateHealthSlider();
    }

    void InitializeHealthSlider()
    {
        if (healthSlider != null)
        {
            healthSlider.maxValue = maxHp;
            healthSlider.value = hp;
        }
    }

    void UpdateHealthSlider()
    {
        if (healthSlider != null)
        {
            healthSlider.value = hp;
        }
    }

    void GetDamage(int damage)
    {
        // 데미지 피드백 재생
        if (!getDamageFeedback.IsPlaying)
        {
            getDamageFeedback.PlayFeedbacks();
        }

        // 현재 체력 감소
        hp -= damage;

        // 데미지를 입었을 때의 애니메이션을 처리하는 코루틴 시작
        StartCoroutine(DamagedAnimation());

        // 체력 슬라이더 업데이트
        UpdateHealthSlider();

        // 체력이 0 이하일 경우 사망 처리
        if (hp <= 0)
        {
            hp = 0;
            Die();
        }
    }

    // 데미지를 입었을 때의 애니메이션 코루틴
    IEnumerator DamagedAnimation()
    {
        // 이미 damagedSprite인 경우 코루틴을 빠져나감
        if (spriteRenderer.sprite == damagedSprite)
        {
            yield break;
        }

        // 데미지 스프라이트로 변경
        spriteRenderer.sprite = damagedSprite;

        // 짧은 시간 동안 대기
        yield return new WaitForSeconds(0.4f);

        // 노멀 스프라이트로 변경
        spriteRenderer.sprite = normalSprite;
    }

    void Die()
    {
        // 이미 사망한 경우 빠져나감
        if (isDead)
        {
            return;
        }
        isDead = true;
        // 사망 피드백 재생
        dieFeedback.PlayFeedbacks();

        // 골드 파티클 생성 및 파괴
        GameObject goldP = Instantiate(goldParticle, transform.position, Quaternion.identity);
        Destroy(goldP, 1);

        // 게임 매니저 상태 업데이트 및 다음 적 생성
        gameManager.isEnemyExist = false;
        gameManager.SpawnEnemy();
        gameManager.GetGold(Random.Range(1, 5));

        // 적 오브젝트 파괴
        Destroy(gameObject);
    }

    // 총알과 충돌했을 때 호출되는 함수
    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.tag == "Bullet")
        {
            // 충돌한 총알 파괴 및 데미지 처리
            Destroy(col.gameObject);
            GetDamage(1);
        }
    }
}
