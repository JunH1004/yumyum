using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using MoreMountains.Feedbacks;

public class Enemy : MonoBehaviour
{
    [SerializeField]
    private int hp;
    private int maxHp = 20; // Set your maximum HP value here
    private bool isDead = false;
    GameManager gameManager;

    public MMF_Player getDamageFeedback;
    public MMF_Player dieFeedback;
    public GameObject goldParticle;
    public Slider healthSlider; // Reference to the Slider UI component

    // Start is called before the first frame update
    void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        InitializeHealthSlider();
    }

    // Initialize the health slider with current and max HP values
    void InitializeHealthSlider()
    {
        if (healthSlider != null)
        {
            healthSlider.maxValue = maxHp;
            healthSlider.value = hp;
        }
    }

    // Update is called once per frame
    void Update()
    {
        UpdateHealthSlider();
    }

    // Update the health slider's value based on current HP
    void UpdateHealthSlider()
    {
        if (healthSlider != null)
        {
            healthSlider.value = hp;
        }
    }

    void GetDamage(int damage)
    {
        hp -= damage;
        if (!getDamageFeedback.IsPlaying)
        {
            getDamageFeedback.PlayFeedbacks();
        }

        // Update the health slider when taking damage
        UpdateHealthSlider();

        // Damage feedback
        if (hp <= 0)
        {
            hp = 0;
            Die();
        }
    }

    void Die()
    {
        if (isDead) {
            return;
        }

        isDead = true;
        dieFeedback.PlayFeedbacks();
        GameObject goldP = Instantiate(goldParticle, transform.position, Quaternion.identity);
        Destroy(goldP, 1);
        gameManager.isEnemyExist = false;
        gameManager.SpawnEnemy();
        gameManager.GetGold(Random.Range(1,5));
        Destroy(gameObject);
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.tag == "Bullet")
        {
            Destroy(col.gameObject);
            GetDamage(1);
        }
    }
}
